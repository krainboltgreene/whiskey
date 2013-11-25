module Whiskey
  class Server
    module Control
      def self.included(base)
        base.extend(ClassMethods)
      end

      def self.controls
        control_classes.select do |constant|
          constant.respond_to?(:to_resource)
        end
      end

      def self.to_resources
        controls.map(&:to_resource).inject(&:merge!)
      end

      private

      def self.control_classes
        Whiskey.configuration.control.constants.map(&method(:const_get))
      end

      module ClassMethods
        def to_resource
          {
            name.demodulize.downcase => actions.map(&:to_verb).inject(&:merge!)
          }
        end

        def actions
          constants.map(&method(:const_get)).select do |constant|
            constant.respond_to?(:to_verb)
          end
        end
      end
    end
  end
end
