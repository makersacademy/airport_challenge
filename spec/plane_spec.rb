require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {Plane.new}
  subject(:airport) {Airport.new}

  describe '#land_at' do

    it 'responds to land_at method' do
      expect(plane).to respond_to(:land_at).with(1).arguments
    end

  end

  describe '#take_off_from' do

    it 'takes off from an airport' do
      expect(plane).to respond_to(:take_off_from).with(1).arguments
    end
    it 'plane has left the airport' do
      allow(airport.weather).to receive(:rand).with(0..9) {3}
      plane.land_at(airport)
      plane.take_off_from(airport)
      expect(plane).to_not be_at(airport)
    end
    it 'raises error if weather is stormy' do
      allow(airport.weather).to receive(:rand).with(0..9) {9}
      expect {plane.take_off_from(airport)}.to raise_error 'cannot take off in stormy weather'
    end

  end

end