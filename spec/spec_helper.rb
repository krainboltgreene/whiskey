require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "pry"
require "rspec"
require "whiskey"
require "whiskey/server"
require "whiskey/command"

shared_context "stubbed logging" do
  let(:log_manager) { instance_double("LogManager") }
  let(:logger) { double("Logger") }
  before(:each) do
    allow(log_manager).to receive(:klass).and_return(logger)
    Whiskey.logger(log_manager)
  end
end

shared_context "stubbed configuration" do
  let(:configuration) { double("Whiskey::Configuration") }
  let(:namespace) { "Foo" }

  before(:each) do
    allow(configuration).to receive(:namespace).and_return(namespace)
    allow(configuration).to receive(:control).and_return("Foo::Control")
    allow(Whiskey::Server).to receive(:configuration).and_return(configuration)
  end
end

shared_context "stubbed body" do
  let(:body) do
    {
      "resource" => "accounts",
      "verb" => "PULL",
      "parameters" => { "id" => 1 }
    }
  end
end
