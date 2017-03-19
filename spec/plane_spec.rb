require 'plane'

describe Plane do
  let(:plane) { double :plane}

  describe '#land' do

    it 'a landed plane is no longer flying' do
      plane = Plane.new
      airport = Airport.new
      allow(airport.weather).to receive(:stormy?) {false}
      airport.land(plane)
      expect(plane.flying?).to eq false
    end
  end

  describe '#take_off' do

    it 'a taken_off plane is flying' do
      plane = Plane.new
      airport = Airport.new
      allow(airport.weather).to receive(:stormy?) {false}
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.flying?).to eq true
    end
  end

end
