require 'airport'
require 'plane'

describe "Feature Test" do
  context "when weather is good and not stormy" do
    it "land and fly planes to multiple airports and check their flying status" do
      gatwick = Airport.new
      heathrow = Airport.new(10)
      manchester = Airport.new(100)
      allow(gatwick.instance_variable_get(:@weather)).to receive(:stormy?).and_return false
      allow(heathrow.instance_variable_get(:@weather)).to receive(:stormy?).and_return false
      allow(manchester.instance_variable_get(:@weather)).to receive(:stormy?).and_return false

      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new

      gatwick.land(plane1)
      gatwick.land(plane2)
      gatwick.take_off(plane2)
      expect(plane2.flying?).to eq(true)

      heathrow.land(plane2)
      expect(plane2.flying?).to eq(false)

      heathrow.land(plane3)
      gatwick.take_off(plane1)
      manchester.land(plane1)
    end
  end

  context "when weather is stormy" do
    it "planes cannot use airport" do
      airport = Airport.new
      allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return false
      plane1 = Plane.new
      airport.land(plane1)

      allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return true
      plane2 = Plane.new
      expect { airport.land(plane2) }.to raise_error(Airport::ERROR[:stormy])
      expect { airport.take_off(plane1) }.to raise_error(Airport::ERROR[:stormy])
    end
  end
end
