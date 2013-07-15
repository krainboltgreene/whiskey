module Whiskey
  class Server
    class Router
      def initialize(control, verb, parameters = {})
        @parameters = parameters
        @action = verb.upcase
        @control = control
      end

      def parameters
        OpenStruct.new(@parameters)
      end

      def to_hash
        if control.safe_constantize && action.safe_constantize
          control_action.safe_constantize.new(parameters).to_hash
        else
          Error.new(:not_found).to_hash
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
