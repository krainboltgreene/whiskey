require "bundler"

if defined?(Bundler)
  ENV["WHISKEY_ENV"] ||= "development"
  Bundler.require ENV["WHISKEY_ENV"].to_sym
end

require "whiskey/server"

unless $LOAD_PATH.include?(File.expand_path("../server", __FILE__))
  $:.unshift File.expand_path("../server", __FILE__)
end

require_relative "lib/<%= name %>"

Whiskey::Server.configure do |config|
  config.host = ENV["WHISKEY_HOST"]
  config.port = ENV["WHISKEY_PORT"]
end
