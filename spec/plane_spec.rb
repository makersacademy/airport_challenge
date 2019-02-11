require_relative "../lib/plane"

describe Plane do
  it { is_expected.to respond_to(:land).with(2).argument }
  it { is_expected.to respond_to(:take_off).with(2).argument }

  it "should be possible to initialize a plane to a specified airport" do
    airport = Airport.new
    plane_1 = Plane.new(airport)

    expect(plane_1.airport).to eq(airport)
    expect(airport.landed_planes).to include(plane_1)
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
      expect { plane.take_off(plane.airport, stormy) }.to raise_error("Error: already airborne.") 
    end
  end

  describe "land(airport, stormy)" do
    it "already landed, must take off before it can land" do
      plane = Plane.new
      airport = Airport.new
      stormy = false
      
      expect(plane.airport).not_to eq nil
      expect { plane.land(airport, stormy) }.to raise_error("Error. Already landed. Take off first")  
    end

    it "land at airport because airport is not full, and it is not stormy" do
      plane = Plane.new
      stormy = false
      airport = Airport.new

      plane.take_off(plane.airport, stormy)
      
      expect(airport.full?).to be false
      
      plane.land(airport, stormy)
      
      expect(airport.landed_planes).to include(plane)
    end

    it "aborts landing because destination is stormy" do
      plane = Plane.new
      airport = Airport.new
      stormy = true

      # plane must be in the air before it can land
      plane.take_off(plane.airport, false)
      
      # unnecessary:
      # expect(!airport.full?)

      expect { plane.land(airport, stormy) }.to raise_error("Landing aborted: Stormy.") 

      expect(airport.landed_planes).not_to include(plane)
    end

    it "aborts landing because destination airport is full" do
      plane = Plane.new
      airport = Airport.new
      stormy = false
      
      plane.take_off(plane.airport, stormy)

      airport.capacity.times { airport.landed_planes.push(Plane.new) }

      expect(airport.full?).to be true

      expect { plane.land(airport, stormy) }.to raise_error("Landing aborted: Airport full.") 

      expect(airport.landed_planes).not_to include(plane)
    end

    it "aborts landing because destination airport is full and it is stormy" do
      plane = Plane.new
      airport = Airport.new
      stormy = true

      plane.take_off(plane.airport, false)

      airport.capacity.times { airport.landed_planes.push(Plane.new) }

      expect(airport.full?).to be true

      expect { plane.land(airport, stormy) }.to raise_error("Landing aborted: Stormy and Airport full") 

      expect(airport.landed_planes).not_to include(plane)
    end

  end

  describe "Bonus: lands and takes off a number of planes" do
    heathrow = Airport.new(3)
    frankfurt = Airport.new(1)
    cdg = Airport.new(2)

    gb_plane = Plane.new(heathrow)
    de_plane = Plane.new(frankfurt)
    fr_plane = Plane.new(cdg)

    it "" do
      expect(heathrow.full?).to eq false
      expect(heathrow.landed_planes).to include(gb_plane)
    end
    expect(frankfurt.full?).to eq true
    expect(frankfurt.landed_planes).to include(de_plane)

    expect(cdg.full?).to eq false
    expect(cdg.landed_planes).to include(fr_plane)


  end

end
