module Whiskey
  class Server
    class Interpretor
      def initialize(input)
        @instruction = input
      end

      def response
        if has_resource? && has_verb?
          route
        else
          resource_not_found
        end.to_hash
      end

      def instruction
        AltStruct.new(@instruction)
      end

      private

      def route
        Router.new(instruction.resource, instruction.verb, instruction.parameters)
      end

      def resource_not_found
        Error.new(:not_found)
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
