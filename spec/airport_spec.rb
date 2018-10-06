
require 'airport'
require 'Plane'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    airport = Airport.new
    plane = Plane.new
    it 'lands at an airport' do
      expect(subject.land(plane)).to include(plane)
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    airport = Airport.new
    plane = Plane.new
    it 'confirms that plane is no longer in the airport' do
      expect(subject.flights).not_to include(plane)
    end
  end
end
