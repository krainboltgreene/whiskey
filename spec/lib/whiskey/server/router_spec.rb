require "spec_helper"

describe Whiskey::Server::Router do
  include_context "stubbed logging"
  include_context "stubbed configuration"

  let(:resource) { "accounts" }
  let(:verb) { "PULL" }
  let(:parameters) { { key: "value" } }
  let(:router) { described_class.new(resource, verb, parameters) }

  describe "#body" do
    let(:body) { router.body }

    it "responds to a key given" do
      expect(body.key).to eq("value")
    end
  end

  # def to_hash
  #   control_action.constantize.new(body).to_hash
  # end

  describe "#to_hash" do
    let(:control_action) { double("ControlAction") }

    it "contains the X" do
      allow(router).to receive(:control_action).and_return(control_action)
      expect(control_action).to receive(:to_hash)
      router.to_hash
    end
  end

  describe "#control" do
    let(:control) { router.control }
    let(:controller_class) { "#{namespace}::Control::Accounts" }

    it "returns the controller class for the resource" do
      expect(control).to eq(controller_class)
    end
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
    let(:valid_route?) { router.valid_route? }

    it "returns true if control and action are defined" do
      allow(described_class).to receive(:const_defined?).and_return(true)
      expect(valid_route?).to be(true)
    end

    it "returns raises if the control or action hasn't been defined" do
      expect { valid_route? }.to raise_error(NameError)
    end
  end
end
