require_relative "../lib/plane"

describe Plane do
  it { is_expected.to respond_to(:land).with(2).argument }
  it { is_expected.to respond_to(:take_off).with(2).argument }

  describe "land(airport, stormy)"
    it "aborts landing because destination airport is full" do
    end

    it "land at airport because airport is not full, and it is not stormy" do
      plane = Plane.new
      airport = Airport.new
      stormy = false
      plane.land(airport, stormy)
      expect(airport.landed_planes).to include(plane)
    end
  end
end
