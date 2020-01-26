require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  describe '#landed?' do
    it 'should respond to the method landed?' do
      expect(plane).to respond_to(:landed?)
    end
    it 'should return true or false if a plane is in an airport' do
      expect(plane.landed?).to eq plane.airport
    end
  end
  describe '#plane_status' do
    subject(:airport) { Airport.new }
    it "should update a plane's airport status when it lands" do
      plane = Plane.new(false)
      allow(Weather).to receive(:stormy?) { false }
      airport.land(plane)
      expect(plane.landed?).to eq(true)
    end
    it "should update a plane's airport status when it takes off" do
      plane = Plane.new(false)
      allow(Weather).to receive(:stormy?) { false }
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.landed?).to eq(false)
    end
  end
end
