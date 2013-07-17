require "whiskey"
require "celluloid/io"
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

    # This method starts the server according to the configuration object
    # and then follows the instructions set by Celluloid-Io examples.
    def self.start
      supervise(@@configuration.host, @@configuration.port)
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

    def run
      loop { async.handle_connection server.accept }
    end

    def finalizer(callback)
      server.close if server
    end

    def handle_connection(socket)
      connection = Connection.new(socket)
      Whiskey.logger.info "New connection created from #{connection.id}"
      begin
        Handler.new(connection).handle
      rescue => connection_error
        Whiskey.logger.error connection_error
      ensure
        # If the connection has been broken, this might not work: Errno::EPIPE
        begin
          socket.write Serializer.new(Error.new(:internal_server_error).to_hash).data
        rescue => socket_error
          Whiskey.logger.error socket_error
        end
        socket.close
      end
    end
  end
end
