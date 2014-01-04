module Whiskey
  class Server
    # The Handler class is the runtime loop around processing connection feeds.
    class Handler
      extend Forwardable

      attr_reader :connection

      def_delegator :@connection, :close
      def_delegator :@connection, :write
      def_delegator :@connection, :id

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
