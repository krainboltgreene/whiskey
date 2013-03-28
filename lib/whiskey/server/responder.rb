module Whiskey
  class Server
    class Responder
      attr_accessor :serializer

      def initialize(output)
        self.serializer = Serializer.new(output)
      end

      def serialize
        serializer.dump
      end
    end
  end
end
