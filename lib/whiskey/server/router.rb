module Whiskey
  class Server
    class Router
      def initialize(resource, verb, parameters = {})
        @control = resource
        @action = verb.upcase
        @body = parameters
      end

      def body
        OpenStruct.new(@parameters)
      end

      def to_hash
        Whiskey.logger.info("#{@action} /#{@control} #{@body.inspect}")
        control_action.constantize.new(body).to_hash
      end

      def control
        "#{Server.configuration.namespace}::Control::#{@control.camelize}"
      end

      def action
        case
          when @action == "PULL" then "List"
          when @action == "PUSH" then "Create"
          when @action == "PULL" && parameters.id then "Show"
          when @action == "PUSH" && parameters.id then "Update"
        end
      end

      def valid_route?
        defined_control? && defined_action?
      end

      private

      def control_action
        "#{control}::#{action}"
      end

      def defined_control?
        self.class.const_defined?(control)
      end

      def defined_action?
        self.class.const_defined?(action)
      end
    end
  end
end
