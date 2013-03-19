module Whiskey
  class Server
    class Receiver
      attr_accessor :incoming

      def initialize(connection)
        self.incoming = connection.readpartial(4096).chomp!
      end
    end
  end
end
