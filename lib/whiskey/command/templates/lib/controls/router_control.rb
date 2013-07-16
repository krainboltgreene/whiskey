module Controls
  module RouteControl

    class IndexAction < Action
    include Whiskey::Server::Control
      include RouteControl

      def initialize
        @routes = Controls.constants.select do |constant|
          constant.end_with?("Control")
        end.map(&:to_route)
      end

      def to_hash
        {
          routes: @routes
        }
      end
    end
  end
end
