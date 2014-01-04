require "spec_helper"

describe Whiskey::Server::Interpretor do
  include_context "stubbed logging"
  include_context "stubbed body"

  let(:router) { instance_double("Whiskey::Server::Router") }
  let(:interpretor) { described_class.new(body) }

  before(:each) do
    allow(interpretor).to receive(:router).and_return(router)
  end

  describe "#response" do
    let(:response) { interpretor.response }

    before(:each) do
      allow(router).to receive(:valid_route?).and_return(true)
    end

    it "returns a router response" do
      expect(response).to be(router)
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
