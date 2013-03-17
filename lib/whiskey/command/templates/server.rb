require "bundler"

if defined?(Bundler)
  ENV["WHISKEY_ENV"] ||= "development"
  Bundler.require ENV["WHISKEY_ENV"].to_sym
end

$LOAD_PATH.unshift(__FILE__) unless $LOAD_PATH.include?(__FILE__)
require "<%= name %>"

module <%= name_as_constant %>
  class Server < Whiskey::Server

  end
end
