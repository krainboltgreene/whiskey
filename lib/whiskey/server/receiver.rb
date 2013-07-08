module Whiskey
  class Server
    class Receiver
      attr_reader :deserializer

      def initialize(input)
        @deserializer = Deserializer.new(input)
      end

      def deserialize
        deserializer.data
      end

      def valid?
        deserializer.valid?
      end
    end
  end
end
