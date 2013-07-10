module Whiskey
  class Server
    class Interpretor
      def initialize(input)
        @instruction = input
        @response = if has_control? && has_verb?
          Router.new(instruction.control, instruction.verb, instruction.parameters)
        else
          Error.new(:not_found)
        end
      end

      def response
        @response.to_hash
      end

      def instruction
        AltStruct.new({ "parameters" => nil }.merge(@instruction))
      end

      private

      def has_control?
        @instruction.has_key?("control")
      end

      def has_verb?
        @instruction.has_key?("verb")
      end
    end
  end
end
