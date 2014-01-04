module Whiskey
  class Server
    # The Deserializer's job is to take the input from outside and parse it.
    class Deserializer
      attr_reader :data

      def initialize(raw)
        @data = MultiJson.load(raw)
      rescue MultiJson::LoadError => error
        Whiskey.logger.error(error)
      end

      def valid?
        !@data.nil?
      end
    end
  end
end
