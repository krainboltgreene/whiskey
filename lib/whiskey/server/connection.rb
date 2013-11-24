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
        write run.output
      end

      private

      def run
        Cycle.new(incoming).tap(&:interpret!)
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

      def close
        socket.close
      end
    end
  end
end
