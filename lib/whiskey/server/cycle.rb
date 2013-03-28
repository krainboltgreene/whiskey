module Whiskey
  class Server
    class Cycle
      attr_accessor :input

      def initialize(input)
        binding.pry
        self.input = deserialized(input)
      end

      def interpret
        self.response = Interpretor.new(input).response
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
