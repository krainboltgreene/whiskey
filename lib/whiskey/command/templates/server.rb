require "bundler"

if defined?(Bundler)
  ENV["WHISKEY_ENV"] ||= "development"
  Bundler.require ENV["WHISKEY_ENV"].to_sym
end

unless $LOAD_PATH.include?(File.expand_path("../server", __FILE__))
  $:.unshift File.expand_path("../server", __FILE__)
end

require "<%= name %>"

Whiskey::Server.new do |config|
  # config.
end
