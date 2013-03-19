module Whiskey
  class Server
    class Reader
      attr_accessor :data

      def initialize(connection)
        self.data = connection.readpartial(4096)
      end
    end
  end
end
