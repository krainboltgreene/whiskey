require "active_record"
require "forwardable"
require "multi_json"
require "astruct"
require "logger"

require_relative "whiskey/version"

module Whiskey
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end
