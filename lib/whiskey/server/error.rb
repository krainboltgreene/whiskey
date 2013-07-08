module Whiskey
  class Server
    class Error
      def initialize(code)
        @message = case code
        when :bad_request
          "BAD REQUEST - The request cannot be fulfilled due to bad syntax"
        end
      end

      def to_hash
        {
          status: 400,
          error: @message
        }
      end
    end
  end
end
