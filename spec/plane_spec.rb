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
      plane.land_at(airport)
      plane.take_off_from(airport)
      expect(plane).to_not be_at(airport)
    end

  end

end