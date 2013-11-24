require "spec_helper"

describe Whiskey::Server::Connection do
  let(:ip) { "127.0.0.1" }
  let(:port) { "4000" }
  let(:socket) { double("Socket") }
  let(:connection) { described_class.new(socket) }
  let(:delimiter) { ":" }

  before do
    allow(socket).to receive(:peeraddr) { [nil, port, nil, ip] }
    allow(socket).to receive(:readpartial) { "foo" }
  end

  describe "#id" do
    let(:id) { connection.id }

    it "contains the ip" do
      expect(id).to include(ip)
    end

    it "contains the port" do
      expect(id).to include(port)
    end

    it "delimits with the : character" do
      expect(id).to include(delimiter)
    end
  end

  describe "#process" do
    pending
  end
end
