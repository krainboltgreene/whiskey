require "celluloid/io"
require_relative "server/configuration"
require_relative "server/handler"
require_relative "server/connection"
require_relative "server/cycle"

module Whiskey
  class Server
    include Celluloid::IO

    # This method is the start point for the server, allowing the user
    # to pass in settings for the server. It can be done like this:
    #
    #     Whiskey::Server.configure(host: "localhost", port: 4222)
    #
    # or with a block:
    #
    #     Whiskey::Server.configure do |config|
    #       config.host = "localhost"
    #       config.port = 4222
    #     end
    def self.configure(options = {}, &block)
      @@configuration = Configuration.new(options)
      instance_exec(block, @@configuration) if block_given?
      start
    end

    def self.start
      supervise(@@configuration.host, @@configuration.port)
      trap("INT") { supervisor.terminate; exit } and sleep
    end

    attr_reader :server

    def initialize(host, port)
      puts "Serving whiskey at #{host}:#{port}..."
      @server = TCPServer.new(host, port)
      async.run
    end

    def run
      loop { async.handle_connection server.accept }
    end

    def finalizer(callback)
      server.close if server
    end

    def handle_connection(socket)
      Handler.new(Connection.new(socket)).handle
    end
  end
end
