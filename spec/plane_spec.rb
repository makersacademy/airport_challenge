require_relative "../lib/plane"

describe Plane do
  it { is_expected.to respond_to(:land).with(2).argument }
  it { is_expected.to respond_to(:take_off).with(2).argument }

  describe "land(airport, stormy)" do
    it "land at airport because airport is not full, and it is not stormy" do
      plane = Plane.new
      airport = Airport.new
      stormy = false
      plane.land(airport, stormy)
      expect(airport.landed_planes).to include(plane)
    end

    it "aborts landing because destination it is stormy" do
      plane = Plane.new
      airport = Airport.new
      stormy = true

      expect(!airport.full?)

      expect { plane.land(airport, stormy) }.to raise_error("Landing aborted: Stormy.") 

      expect(airport.landed_planes).not_to include(plane)
    end

    it "aborts landing because destination airport is full" do
      plane = Plane.new
      airport = Airport.new
      stormy = false

      airport.capacity.times { airport.landed_planes.push(Plane.new) }

      expect(airport.full?)

      expect { plane.land(airport, stormy) }.to raise_error("Landing aborted: Airport full.") 

      expect(airport.landed_planes).not_to include(plane)
    end

    it "aborts landing because destination airport is full and it is stormy" do
      plane = Plane.new
      airport = Airport.new
      stormy = true

      airport.capacity.times { airport.landed_planes.push(Plane.new) }

      expect(airport.full?)

      expect { plane.land(airport, stormy) }.to raise_error("Landing aborted: Stormy and Airport full") 

      expect(airport.landed_planes).not_to include(plane)
    end

  end
end
