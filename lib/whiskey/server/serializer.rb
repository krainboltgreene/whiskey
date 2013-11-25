module Whiskey
  class Server
    class Serializer
      attr_reader :data

      def initialize(raw)
        if raw.is_a?(Hash) || raw.is_a?(Array)
          @data = MultiJson.dump(raw)
        else
          Whiskey.logger.error "Raw data wasn't a Hash"
        end
      end

      def valid?
        !@data.nil?
      end
    end
  end
end
