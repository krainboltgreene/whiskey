require "spec_helper"

describe Whiskey::Server::Configuration do
  let(:host) { "foo" }
  let(:port) { "bar" }
  let(:delimiter) { ":" }
  let(:configuration) { described_class.new(host: host, port: port) }

  describe "#to_s" do
    let(:to_s) { configuration.to_s }

    it "contains the host" do
      expect(to_s).to include(host)
    end

    it "contains the port" do
      expect(to_s).to include(port)
    end

    it "delimits with a : character" do
      expect(to_s).to include(delimiter)
    end
  end
end
