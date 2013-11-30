module Whiskey
  class Server
    class Handler
      extend Forwardable

      attr_reader :connection

      def_delegator :@connection, :close, :write

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
