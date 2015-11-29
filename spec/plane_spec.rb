require 'plane'

describe Plane do
  let(:airport) { double :airport }
  describe "#flying?" do
    it "sets flying status to default to true" do
      expect(subject.flying?).to eq true
    end
    it "expects flying status to change to false after landing" do
      allow(airport).to receive(:land).with(subject) { subject.grounded }
      airport.land(subject)
      expect(subject.flying?).to eq false
    end
    it "expects flying status to change to true after take-off" do
      allow(airport).to receive(:take_off).with(subject) { subject.flying }
      airport.take_off(subject)
      expect(subject.flying?).to eq true
    end
  end
  describe "#location" do
    it "expects the plane to respond to a location method" do
      expect(subject).to respond_to(:location)
    end
  end
end