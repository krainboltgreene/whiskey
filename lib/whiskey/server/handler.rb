module Whiskey
  class Server
    class Handler
      attr_accessor :connection

      def initialize(socket)
        self.connection = Connection.new(socket)
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
