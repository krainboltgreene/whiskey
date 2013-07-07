module Whiskey
  class Server
    class Handler
      attr_reader :connection

      def initialize(connection)
        @connection = connection
      end

      def handle
        loop do
          connection.process
        end
      rescue EOFError
        # disconnect
      end
    end
  end
end
