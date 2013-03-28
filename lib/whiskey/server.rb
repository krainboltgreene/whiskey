require 'celluloid/io'
require_relative "server/configuration"
require_relative "server/handler"
require_relative "server/connection"
require_relative "server/cycle"

module Whiskey
  class Server
    include Celluloid::IO

    def self.configure(configuration = Configuration.new)
      yield configuration
      start(configuration)
    end

    def self.start(configuration)
      supervise(configuration.host, configuration.port)
      trap("INT") { supervisor.terminate; exit } and sleep
    end

    attr_accessor :server

    def initialize(host, port)
      puts "Serving whiskey at #{host}:#{port}..."
      self.server = TCPServer.new(host, port)
      async.run
    end

    def run
      loop { async.handle_connection server.accept }
    end

    def finalize
      server.close if server
    end

    def handle_connection(socket)
      handler(connection(socket)).handle
    end

    private

    def handler(connection)
      Handler.new(connection)
    end

    def connection(socket)
      Connection.new(socket)
    end
  end
end
