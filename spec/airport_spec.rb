require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it "Docks plane when landed" do
      airport = Airport.new
      plane = Plane.new
      expect(subject.land(plane)).to include(plane)
    end
  end
  describe '#take_off' do
    it 'Plane takes off from airport' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off(plane)).to be_an_instance_of Plane
    end
    it "Shows the plane is no longer in airport" do
      plane = Plane.new
      airport = Airport.new
      expect(subject.planes).not_to include(plane)
    end

  end
end
