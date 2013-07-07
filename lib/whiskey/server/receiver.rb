module Whiskey
  class Server
    class Receiver
      attr_reader :deserializer

      def initialize(input)
        @deserializer = Deserializer.new(input)
      end

      def deserialize
        if valid?
          deserializer.load
        else
          errors
        end
      end

      def valid?
        deserializer.errors.empty?
      end
    end
  end
end
