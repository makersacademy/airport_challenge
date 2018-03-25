require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it "Docks plane when landed" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to include(plane)
    end
  end
  describe '#take_off' do
    it 'Plane takes off from airport' do
      airport = Airport.new
      airport.land(Plane.new)
      expect(airport.take_off).to be_an_instance_of Plane
    end
  end
end
