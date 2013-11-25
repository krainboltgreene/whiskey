require "spec_helper"

describe Whiskey::Server::Router do
  let(:resource) { "accounts" }
  let(:verb) { "PULL" }
  let(:parameters) { {} }
  let(:router) { described_class.new(resource, verb, parameters) }

  describe "#body" do

  end

  describe "#to_hash" do

  end

  describe "#control" do

  end

  describe "#action" do
    let(:action) { router.action }

    context "when verb is PULL" do
      let(:verb) { "PULL" }

      it "returns List" do
        expect(action).to eq("List")
      end

      context "with an id key/value in parameters" do
        let(:parameters) { { id: 40 } }

        it "returns Show" do
          expect(action).to eq("Show")
        end
      end
    end

    context "when verb is PUSH" do
      let(:verb) { "PUSH" }

      it "returns Create" do
        expect(action).to eq("Create")
      end

      context "with an id key/value in parameters" do
        let(:parameters) { { id: 40 } }

        it "returns Update" do
          expect(action).to eq("Update")
        end
      end
    end
  end

  describe "#valid_route?" do

  end

  describe "#control_action" do

  end

  describe "#defined_control?" do

  end

  describe "#defined_action?" do

  end
end
