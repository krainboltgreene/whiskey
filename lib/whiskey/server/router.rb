require "pry"
module Whiskey
  class Server
    class Router
      def initialize(resource, verb, parameters = {})
        @control = resource
        @action = verb.upcase
        @body = parameters
        binding.pry
        @route = if control.safe_constantize && control_action.safe_constantize
          Whiskey.logger.info("#{@action} /#{@control} #{@body.inspect}")
          control_action.safe_constantize.new(body)
        else
          Error.new(:not_found)
        end
      end

      def body
        OpenStruct.new(@parameters)
      end

      def to_hash
        @route.to_hash
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

      private

      def control_action
        "#{control}::#{action}"
      end
    end
  end
end
