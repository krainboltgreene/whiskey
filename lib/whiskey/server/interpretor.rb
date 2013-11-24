module Whiskey
  class Server
    class Interpretor
      def initialize(input)
        @instruction = input
        @router = Router.new(instruction.resource, instruction.verb, instruction.parameters)
      end

      def response
        if valid_input?
          @router
        else
          Error.new(:not_found)
        end
      end

      def instruction
        AltStruct.new(@instruction)
      end

      private

      def valid_input?
        has_resource? && has_verb? && @router.valid_route?
      end

      def has_resource?
        instruction.respond_to?("resource")
      end

      def has_verb?
        instruction.respond_to?("verb")
      end
    end
  end
end
