module Whiskey
  class Server
    class Interpretor
      def initialize(input)
        @instruction = input
        @response = if has_resource? && has_verb?
          Router.new(instruction.resource, instruction.verb, instruction.parameters)
        else
          Error.new(:not_found)
        end
      end

      def response
        @response.to_hash
      end

      def instruction
        OpenStruct.new(@instruction)
      end

      private

      def has_resource?
        @instruction.has_key?("resource")
      end

      def has_verb?
        @instruction.has_key?("verb")
      end
    end
  end
end
