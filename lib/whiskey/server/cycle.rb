module Whiskey
  class Server
    class Cycle
      attr_reader :reception
      attr_reader :interpretor

      def initialize(raw)
        @reception = raw
      end

      def interpret!
        @interpretor = Interpretor.new(input)
      end

      def input
        if receiver.valid?
          receiver.deserialize
        else
          @response = Error.new(:bad_request).to_hash
        end
      end

      def output
        responder.serialize
      end

      private

      def response
        @response || interpretor.response
      end

      def responder
        @responder ||= Responder.new(response)
      end

      def receiver
        @receiver ||= Receiver.new(reception)
      end
    end
  end
end
