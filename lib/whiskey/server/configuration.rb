module Whiskey
  class Server
    class Configuration < AltStruct
      def control_class
        "#{namespace}::Control"
      end

      def control
        control_class.constantize if defined?(control_class)
      end

      def to_s
        "#{host}:#{port}"
      end
    end
  end
end
