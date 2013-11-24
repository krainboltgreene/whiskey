require "spec_helper"

describe Whiskey::Server::Interpretor do
  include_context "stubbed logging"

  let(:body) do
    {
      "resource" => "accounts",
      "verb" => "PULL",
      "parameters" => { "id" => 1}
    }
  end
  let(:interpretor) { described_class.new(body) }

  describe "#response" do
    let(:response) { interpretor.response }

    it "returns a router response" do
      allow_any_instance_of(Whiskey::Server::Router).to receive(:defined_control?).and_return(true)
      allow_any_instance_of(Whiskey::Server::Router).to receive(:defined_action?).and_return(true)
      expect(response).to be_a(Whiskey::Server::Router)
    end

    context "with a bad instruction" do
      let(:status) { response.status }
      it "returns an error if not given a resource" do
        allow(interpretor).to receive(:has_resource?).and_return(false)
        expect(status).to eq(404)
      end

      it "returns an error if not given a verb" do
        allow(interpretor).to receive(:has_verb?).and_return(false)
        expect(status).to eq(404)
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




