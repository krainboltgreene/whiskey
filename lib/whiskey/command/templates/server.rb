require "bundler"

if defined?(Bundler)
  ENV["WHISKEY_ENV"] ||= "development"
  Bundler.require
  Bundler.require ENV["WHISKEY_ENV"].to_sym
end

require "whiskey/server"

unless $LOAD_PATH.include?(File.expand_path("../lib", __FILE__))
  $:.unshift File.expand_path("../lib", __FILE__)
end

require "<%= values.name %>"

Whiskey::Server.configure do |config|
  config.host = ENV["WHISKEY_HOST"] || ENV["HOST"] || "0.0.0.0"
  config.port = ENV["WHISKEY_PORT"] || ENV["PORT"] || 9000
end
