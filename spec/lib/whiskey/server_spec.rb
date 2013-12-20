require "spec_helper"

describe Whiskey::Server do
  include_context "stubbed logging"

  let(:host) { "localhost" }
  let(:port) { 4000 }
  let(:server) { described_class.new(host, port) }
  let(:connection) { double("Whiskey::Server::Connection") }

  before(:each) do
    allow(described_class).to receive(:supervise).with(host, port)
    allow(described_class).to receive(:trap).with("INT")
    allow(described_class).to receive(:sleep)
  end

  describe ".configure" do
    before(:each) do
      allow(described_class).to receive(:start)
      described_class.configure(bar: "foo") do |config|
        config.foo = "bar"
      end
    end

    let(:configuration) do
      described_class.configuration
    end

    it "sets @@configure with a Configuration" do
      expect(configuration).to be_a(Whiskey::Server::Configuration)
    end

    it "has a key set when given in block" do
      expect(configuration).to respond_to(:foo)
    end

    it "has a value set when given in block" do
      expect(configuration.foo).to eq("bar")
    end

    it "has a key set when given a hash" do
      expect(configuration).to respond_to(:bar)
    end

    it "has a value set when given a hash" do
      expect(configuration.bar).to eq("foo")
    end
  end

  describe ".start" do
    it "supervises with the host and port" do
      expect(described_class).to receive(:supervise).with("localhost", 4000)
    end

    it "traps until an INT signal is received" do
      expect(described_class).to receive(:trap).with("INT")
    end

    after(:each) do
      described_class.configure(host: host, port: port)
    end
  end

  describe "#handle" do
    let(:handle) { server.handle(connection) }

    it ""
  end
end
