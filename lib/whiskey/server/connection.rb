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

      def connected
        puts "#{id} has connect!"
      end

      def disconnected
        puts "#{id} has disconnected!"
      end

      private

      def family
        peeraddr[0]
      end

      def port
        peeraddr[1]
      end

      def host
        peeraddr[2]
      end

      def ip
        peeraddr[3]
      end
    end
  end
end
