module Whiskey
  class Server
    class Cycle
      attr_reader :input
      attr_reader :response

      def initialize(input)
        @input = deserialized(input)
      end

      def interpret!
        @response ||= Interpretor.new(input).response
      end

      def output
        serialized(response)
      end

      private

      def deserialized(input)
        receiver = Receiver.new(input)
        if receiver.valid?
          receiver.deserialize
        else
          @response = Error.new(:bad_request).to_hash
        end
      end

      def serialized(response)
        Responder.new(response).serialize
      end
    end
  end
end
