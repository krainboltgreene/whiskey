module <%= values.name.camelize %>
  module Control
    module Routes
      include Whiskey::Server::Control

      class List < Action
        include Routes

        @@input = false

        def initialize(parameters)
          @routes = Control.to_resources
        end

        def to_hash
          {
            routes: @routes
          }
        end
      end
    end
  end
end
