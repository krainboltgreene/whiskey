module Whiskey
  class Server
    class Deserializer
      attr_reader :data

      def initialize(raw)
        begin
          @data = MultiJson.load(raw.chomp!)
          @valid = true
        rescue Exception => error
          Whiskey.logger.error error
          @valid = false
        end
      end

      def valid?
        @valid
      end
    end
  end
end
