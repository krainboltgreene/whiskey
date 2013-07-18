require "active_record"
require "forwardable"
require "multi_json"
require "astruct"
require "logger"

require_relative "whiskey/version"

module Whiskey
  def self.logger
    @logger ||= Logger.new(STDOUT).tap do |log|
      log.level = ENV["WHISKEY_ENVIRONMENT"] == "development" ? Logger::DEBUG : Logger::INFO
      log.formatter = nil
    end
  end
end
