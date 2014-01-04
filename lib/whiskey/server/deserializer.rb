module Whiskey
  class Server
    # The Deserializer's job is to take the input from outside and parse it.
    class Deserializer
      attr_reader :data

      def initialize(raw)
        begin
          @data = MultiJson.load(raw)
        rescue MultiJson::LoadError => error
          Whiskey.logger.error error
        end
      end

      def valid?
        !@data.nil?
      end
    end
  end
end
