module Whiskey
  class Server
    class Handler
      attr_reader :connection

      def initialize(connection)
        @connection = connection
      end

      def handle
        connection.connected
        loop do
          Receiver.new(connection)
        end
      rescue EOFError
        connection.disconnected
      end
    end
  end
end
