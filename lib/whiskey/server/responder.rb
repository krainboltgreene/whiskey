module Whiskey
  class Server
    class Responder
      attr_reader :serializer

      def initialize(output)
        @serializer = Serializer.new(output)
      end

      def serialize
        serializer.data
      end

      def valid?
        serializer.valid?
      end
    end
  end
end
