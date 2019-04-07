require 'weather'

describe Weather do
  context "generates random weather" do
    it "returns 'sunny' when rand is 1" do
      allow(subject).to receive(:rand) { 1 }
      expect(subject.randomiser).to eq "sunny"
    end
    it "returns 'stormy' when rand is 8" do
      allow(subject).to receive(:rand) { 8 }
      expect(subject.randomiser).to eq "stormy"
    end
  end
  context "when the weather is stormy" do
    let(:plane) { Plane.new }
    let(:airport) { Airport.new }
    let(:forecast) { "stormy" }

    it "take_off is prevented" do
      expect(airport.take_off(plane, forecast)).to eq "Takeoff prevented due to stormy weather"
    end
    it "landing is prevented" do
      expect(plane.land_at(airport, forecast)).to eq "Landing prevented due to stormy weather"
    end
  end
end
