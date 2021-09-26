require_relative "../lib/airport"

RSpec.describe Airport do
  describe ".init" do
    it "creates and airport with custom capacity" do
      capacity = 9
      airport = Airport.new(capacity)
      capacity.times do
        airport.land(Plane.new)
      end
      expect { airport.land(Plane.new) }.to raise_error "Cannot land, airport is full"
    end
  end

  describe ".land" do
    it "lands the plane at an empty space in the airport" do 
      plane = Plane.new()
      airport = Airport.new()
      airport.land(plane)
      expect(airport.planes_at_airport.count).to eq 1
      expect(airport.planes_at_airport[0]).to eq plane
    end
    
    it "raises an error when landing planes in a full airport" do
      airport = Airport.new
      airport.plane_capacity.times do
        airport.land(Plane.new)
      end
      expect { airport.land(Plane.new) }.to raise_error "Cannot land, airport is full"
    end

    it "raises and error if the plane about to be landed is has already landed" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "You can't land a plane that's already at the airport"
    end
  end

  describe ".take_off" do
    it "raise an error when a plane instructed to take off is not at the airport" do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.to raise_error "Cannot instruct a plane that isn't at the airport to take off"
    end

    it "allows a plane to take off" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
      expect { airport.take_off(plane) }.to raise_error "Cannot instruct a plane that isn't at the airport to take off"
    end
  end
end
