module Whiskey
  class Server
    class Connection
      extend Forwardable

      def_delegators :socket, :write, :readpartial, :peeraddr

      attr_accessor :socket

      def initialize(socket)
        self.socket = socket
      end

      def id
        "#{ip}:#{port}"
      end

      private

      def port
        peeraddr[1]
      end

      def ip
        peeraddr[3]
      end
    end
  end
end
