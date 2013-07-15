module Controls
  module RouteControl
    include Controls

    class IndexAction < Action
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
