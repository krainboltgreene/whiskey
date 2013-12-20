require "whiskey"
require "celluloid/io"
require "astruct"
require "multi_json"
require "forwardable"

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
      instance_exec(@@configuration, &block) if block_given?
      start
    end

    def self.configuration
      @@configuration
    end

    # This method starts the server according to the configuration object
    # and then follows the instructions set by Celluloid-Io examples.
    def self.start
      supervise(@@configuration.host, @@configuration.port.to_i)
      trap("INT") { supervisor.terminate; exit }
      sleep
    end

    attr_reader :server

    def initialize(host, port)
      Whiskey.logger.info "Initializing a server at #{@@configuration}..."
      @server = TCPServer.new(host, port)
      Whiskey.logger.info "Successfully bound host and port!"
      async.run
    end

    def finalizer(callback)
      server.close if server
    end

    private

    def run
      loop { async.process handle connection_with(server) }
    end

    def process(handler)
      Whiskey.logger.info("New connection created from #{handler.id}")
      begin
        handler.process
      rescue => error
        Whiskey.logger.error(error)
      ensure
        # If the connection has been broken, this might not work: Errno::EPIPE
        begin
          handler.write(serialized_internal_server_error)
        rescue => error
          Whiskey.logger.error(error)
        end
        handler.close
      end
    end

    def serialized_internal_server_error
      Serializer.new(internal_server_error).data
    end

    def internal_server_error
      Error.new(:internal_server_error).to_hash
    end

    def handle(connection)
      Handler.new(connection)
    end

    def connection_with(server)
      Connection.new(server.accept)
    end
  end
end

require_relative "server/configuration"
require_relative "server/handler"
require_relative "server/connection"
require_relative "server/cycle"
require_relative "server/receiver"
require_relative "server/deserializer"
require_relative "server/interpretor"
require_relative "server/responder"
require_relative "server/serializer"
require_relative "server/error"
require_relative "server/control"
require_relative "server/action"
require_relative "server/router"
