require 'plane'

describe Plane do
  describe '#land_plane' do
    it "should raise airport is full if full" do
      airport = Airport.new(1)
      plane = Plane.new(airport)
      airport2 = Airport.new
      plane2 = Plane.new(airport2)
      plane2.takeoff
      expect {plane2.land_plane(airport)}.to raise_error "The airport is full"
    end
  end
end
