require 'plane'

describe Plane do

  describe '#land_at' do

    it 'responds to land_at method' do
      expect(Plane.new).to respond_to(:land_at).with(1).arguments
    end

  end

  describe '#take_off_from' do

    it 'takes off from an airport' do
      expect(Plane.new).to respond_to(:take_off_from).with(1).arguments
    end
    it 'plane has left the airport' do
      plane, airport = Plane.new, Airport.new
      plane.land_at(airport)
      plane.take_off_from(airport)
      expect(plane).to_not be_at(airport)
    end

  end

end