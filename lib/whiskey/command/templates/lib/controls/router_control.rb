module Controls
  module RouteControl
    include Whiskey::Server::Control
    
    class ListAction < Action
      include RouteControl

      def initialize(parameters)
        @routes = Controls.controls.map(&:to_route)
      end

      def to_hash
        {
          routes: @routes
        }
      end
    end
  end
end
