require 'airport'
require 'plane'
describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to :land }

#  As an air traffic controller
#  So I can get passengers to a destination
#  I want to instruct a plane to land at an airport
  describe '#land' do
    it 'lands plane at airport' do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end

    describe '#any_planes'
    it 'shows if there are planes at airport' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.any_planes?).to eq [plane]
    end
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  describe '#takeoff' do
    it 'takes off a plane from airport' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.takeoff).to eq plane
    end

    it 'has no planes at airport' do
      plane = Plane.new
      airport.land(plane)
      airport.takeoff
      expect(airport.any_planes?).to eq []
    end
  end
end
