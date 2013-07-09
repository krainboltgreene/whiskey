module Whiskey
  class Server
    class Connection
      extend Forwardable

      attr_reader :socket

      def initialize(socket)
        @socket = socket
      end

      def id
        "#{ip}:#{port}"
      end

      def process
        write cycle
      end

      private

      def cycle
        Cycle.new(incoming).tap(&:interpret!).output
      end

      def incoming
        readpartial(4096)
      end

      def port
        peeraddr[1]
      end

      def ip
        peeraddr[3]
      end

      def write(*args)
        socket.write(*args)
      end

      def readpartial(*args)
        socket.readpartial(*args)
      end

      def peeraddr(*args)
        socket.peeraddr(*args)
      end
    end
  end
end
