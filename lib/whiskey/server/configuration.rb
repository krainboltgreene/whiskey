module Whiskey
  class Server
    class Configuration < AltStruct
      def to_s
        "#{host}:#{port}"
      end
    end
  end
end
