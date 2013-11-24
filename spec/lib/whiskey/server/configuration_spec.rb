require "spec_helper"

describe Whiskey::Server::Configuration do
  describe "#to_s" do
    let(:host) { "foo" }
    let(:port) { "bar" }
    let(:to_s) { described_class.new(host: host, port: port).to_s }

    it "contains the host" do
      expect(to_s).to include(host)
    end

    it "contains the port" do
      expect(to_s).to include(port)
    end

    it "delimites with a :" do
      expect(to_s).to include("#{host}:#{port}")
    end
  end
end
