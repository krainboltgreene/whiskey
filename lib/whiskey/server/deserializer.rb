module Whiskey
  class Server
    class Deserializer
      attr_accessor :raw, :error

      def initialize(raw)
        self.raw = raw
      end

      def load
        MultiJson.load(raw.chomp!)
      end
    end
  end
end
