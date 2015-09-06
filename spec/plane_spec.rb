require 'plane'

describe Plane do

  describe "#flying?" do

    context "when created" do
      it { is_expected.to respond_to :flying }

      it "is flying" do
        expect(subject.flying).to be_truthy
      end
    end
  end

  describe "#landing" do
    it { is_expected.to respond_to :landing }

    context "when the plane has landed" do
      it "it is not flying" do
        subject.landing
        expect(subject.flying).to be false
      end
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }

    context "when the plane has taken off" do
      it "it is flying" do
        subject.landing
        subject.take_off
        expect(subject.flying).to be_truthy
      end
    end
  end
end
