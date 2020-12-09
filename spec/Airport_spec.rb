require 'Airport'
require 'Plane'

describe Airport do

    it "Checks to see if a plane is in the airport" do
      airport = Airport.new
      plane = Plane.new
      result = airport.in_airport?(plane)
      # Create new plane and ask airport if it is in the airport
      expect(result).to eq false
    end
   
    it "Lets a plane be landed" do
        airport = Airport.new
        plane = Plane.new
        airport.land_plane(plane)
        was_successful = airport.in_airport?(plane)
        expect(was_successful).to eq true
    end

    it "Returns that the airport is not full" do
      airport = Airport.new
      is_full = airport.capacity_max?
      expect(is_full).to eq false
    end

    it "Returns that the airport is full" do
      airport = Airport.new
      5.times{ airport.land_plane(Plane.new) }
      # add 5 (default capacity) new planes to the airport
      is_full = airport.capacity_max?
      expect(is_full).to eq true
    end

    it "When the max capacity is overrided, it changes whether the airport is full accordingly" do
        airport = Airport.new
        airport.override_max_capacity(2)
        2.times{ airport.land_plane(Plane.new) }
        # add 2 new planes to the airport
        is_full = airport.capacity_max?
        expect(is_full).to eq true
    end

end