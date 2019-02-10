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

    it "aborts landing because destination is stormy" do
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

  describe "take_off(airport, stormy)" do
    it "plane is at an airport, it is not stormy, plane takes off" do
      plane = Plane.new
      stormy = false

      expect(plane.airport.class).to eq(Airport)
      last_airport = plane.airport
      plane.take_off(plane.airport, stormy) 
      expect(plane.airport).to eq nil
      expect(last_airport.landed_planes).not_to include(plane)
    end

    it "plane is at an airport, it is stormy, take off aborted" do
      plane = Plane.new
      stormy = true

      expect(plane.airport.class).to eq(Airport)
      expect { plane.take_off(plane.airport, stormy) }.to raise_error("Take-off aborted. Weather is stormy") 
    end

    it "Plane is not at airport so already in the air. Weather irrelevant. Can't take off again" do
      plane = Plane.new
      stormy = false

      plane.take_off(plane.airport, stormy)

      stormy = true 

      expect(plane.airport).to eq nil
      expect { plane.take_off(plane.airport, stormy) }.to raise_error("Error: plane already in the air. Must land before taking off again!") 
    end
  end
end
