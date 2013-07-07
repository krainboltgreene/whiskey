module Whiskey
  class Server
    class Cycle
      attr_reader :input
      attr_reader :response

      def initialize(input)
        @input = deserialized(input)
      end

      def interpret
        @response = Interpretor.new(input).response
      end

      def output
        response.serialize
      end

      def deserialized(input)
        Receiver.new(input).deserialize
      end
    end
  end
end
