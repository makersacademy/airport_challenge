require 'plane'
require 'airport'

describe Plane do
  describe "#land" do
    it "lands at an airport" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) { 5 }
      expect(subject.land(airport)).to eq "Landed!"
    end

    it "raises an error if the weather is too stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) {6}
      expect { subject.land(airport) }.to raise_error "The weather is too stormy!"
    end
  end

  describe "#take_off" do
    it "takes off and confirms" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) {5}
      expect(subject.take_off(airport)).to eq "Taken off!"
    end

    it "raises an error if the weather is too stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) {6}
      expect { subject.take_off(airport) }.to raise_error "The weather is too stormy!"
    end
  end
end
