require "plane"
require "airport"

describe Plane do
  context "knows when it has landed" do
      it "lands" do
        airport = Airport.new
        allow(airport.weather).to receive(:stormy).and_return false
        airport.land(subject)
        expect(subject.landed?).to eq true
    end

    it "takes off" do
      airport = Airport.new
      allow(airport.weather).to receive(:stormy).and_return false
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.landed?).to eq false
    end
  end
end
