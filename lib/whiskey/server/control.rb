module Whiskey
  class Server
    module Control

      def to_resource
        name.downcase.gsub("control")
      end

      def to_route
        {
          resource: to_resource,
          actions: actions.map(&:to_route)
        }
      end

      def actions
      end
    end
  end
end
