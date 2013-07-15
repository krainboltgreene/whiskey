module Whiskey
  class Server
    class Error
      def initialize(code)
        @message = send(code)
      end

      def to_hash
        {
          status: @message[:status],
          error: message
        }
      end

      def message
        "#{@message[:title]} - #{@message[:body]}"
      end

      private

      def bad_request
        {
          title: "BAD REQUEST",
          body: "The request cannot be fulfilled due to bad syntax",
          status: 400
        }
      end

      def unprocessable_entity
        {
          title: "UNPROCESSABLE ENTITY",
          body: "The request was well-formed but was unable to be followed due to semantic errors.",
          status: 422
        }
      end

      def not_found
        {
          title: "RESOURCE NOT FOUND",
          body: "The requested resource could not be found but may be available again in the future. Subsequent requests by the client are permissible.",
          status: 404
        }
      end

      def internal_server_error
        {
          title: "INTERNAL SERVER ERROR",
          body: "The server encountered an unexpected condition which prevented it from fulfilling the request.",
          status: 500
        }
      end

      def method_not_allowed
        {
          title: "Method Not Allowed",
          body: "The method specified in the Request-Line is not allowed for the resource identified by the Request-URI. The response MUST include an Allow header containing a list of valid methods for the requested resource.",
          status: 405
        }
      end
    end
  end
end
