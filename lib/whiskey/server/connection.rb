module Whiskey
  class Server
    class Connection
      extend Forwardable

      def_delegators :socket, :write, :readpartial, :peeraddr

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
    end
  end
end
