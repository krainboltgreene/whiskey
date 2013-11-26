module Whiskey
  class Server
    class Handler
      attr_reader :connection

      def initialize(connection)
        @connection = connection
      end

      def process
        loop do
          connection.process
        end
      end
    end
  end
end
