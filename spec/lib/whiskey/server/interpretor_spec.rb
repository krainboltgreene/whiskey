require "spec_helper"

describe Whiskey::Server::Interpretor do
  let(:body) do
    {
      "resource" => "accounts",
      "verb" => "PULL",
      "parameters" => { "id" => 1}
    }
  end
  let(:route) { double("Route") }
  let(:error) { double("Error") }
  let(:interpretor) { described_class.new(body) }

  before(:each) do
    allow(route).to receive(:to_hash)
    allow(error).to receive(:to_hash)
  end

  describe "#response" do
    let(:response) { interpretor.response }

    it "returns a router" do
      expect(response).to be_a(Whiskey::Server::Route)
    end

    context "with a bad instruction" do
      before(:each) do
        allow(interpretor).to receive(:resource_not_found).and_return(error)
      end

      it "returns an error if not given a resource" do
        allow(interpretor).to receive(:has_resource?).and_return(false)
        expect(response).to be_a(Whiskey::Server::Error)
      end

      it "returns an error if not given a verb" do
        allow(interpretor).to receive(:has_verb?).and_return(false)
        expect(response).to be_a(Whiskey::Server::Error)
      end
    end
  end

  describe "#instruction" do
    let(:instruction) { interpretor.instruction }

    it "responds to resource" do
      expect(instruction).to respond_to(:resource)
    end

    it "responds to verb" do
      expect(instruction).to respond_to(:verb)
    end

    it "responds to parameters" do
      expect(instruction).to respond_to(:parameters)
    end
  end

  describe "#has_resource?" do
  end

  describe "#has_verb?" do
  end
end




