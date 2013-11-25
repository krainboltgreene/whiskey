module Whiskey
  class Server
    class Router
      def initialize(resource, verb, parameters = {})
        @control = resource
        @action = verb.upcase
        @body = parameters
      end

      def body
        AltStruct.new(@body)
      end

      def to_hash
        Whiskey.logger.info("#{@action} /#{@control} #{@body.inspect}")
        control_action.to_hash
      end

      def control
        "#{Server.configuration.control}::#{@control.camelize}"
      end

      def action
        case
          when show? then "Show"
          when update? then "Update"
          when pull? then "List"
          when push? then "Create"
        end
      end

      def valid_route?
        defined_control? && defined_action?
      end

      private

      def control_action_class
        "#{control}::#{action}"
      end

      def control_action
        control_action_class.constantize.new(body)
      end

      def defined_control?
        self.class.const_defined?(control)
      end

      def defined_action?
        self.class.const_defined?(action)
      end

      def pull?
        @action == "PULL"
      end

      def has_id?
        body.respond_to?(:id)
      end

      def push?
        @action == "PUSH"
      end

      def show?
        pull? && has_id?
      end

      def update?
        push? && has_id?
      end
    end
  end
end
