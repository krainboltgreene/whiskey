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
        @route.to_hash
      end

      def control
        "Controls::#{@control.classify}Control"
      end

      def action
        case
          when @action == "PULL" then "ListAction"
          when @action == "PUSH" then "CreateAction"
          when @action == "PULL" && parameters.id then "ShowAction"
          when @action == "PUSH" && parameters.id then "UpdateAction"
        end
      end

      private

      def control_action
        "#{control}::#{action}"
      end
    end
  end
end
