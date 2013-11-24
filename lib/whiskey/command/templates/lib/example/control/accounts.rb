module <%= values.name.camelize %>
  module Control
    module Accounts
      include Whiskey::Server::Control

      class Create < Action
        include Accounts

        def initialize(parameters)

        end

        def to_hash
          {

          }
        end
      end

      class Update < Action
        include Accounts

        def initialize(parameters)

        end

        def to_hash
          {

          }
        end
      end

      class Show < Action
        include Accounts

        def initialize(parameters)

        end

        def to_hash
          {

          }
        end
      end

      class List < Action
        include Accounts

        def initialize(parameters)

        end

        def to_hash
          {

          }
        end
      end
    end
  end
end
