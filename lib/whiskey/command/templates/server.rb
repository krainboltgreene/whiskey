require "bundler"

if defined?(Bundler)
  ENV["WHISKEY_ENVIRONMENT"] ||= "development"
  Bundler.require
  Bundler.require ENV["WHISKEY_ENVIRONMENT"].to_sym
end

require "whiskey/server"

unless $LOAD_PATH.include?(File.expand_path("../lib", __FILE__))
  $:.unshift File.expand_path("../lib", __FILE__)
end

require "<%= values.name %>"

Whiskey::Server.configure do |config|
  config.namespace = <%= values.name.camelize %>
  config.host = ENV["WHISKEY_HOST"] || ENV["HOST"] || "0.0.0.0"
  config.port = ENV["WHISKEY_PORT"] || ENV["PORT"] || 9000
end
