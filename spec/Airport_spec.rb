require 'Airport'
require 'Plane'

describe Airport do

    let(:airport) {Airport.new}

    it "Checks to see if a plane is in the airport" do
      plane = Plane.new
      result = airport.in_airport?(plane)
      # Create new plane and ask airport if it is in the airport
      expect(result).to eq false
    end
      
    it "Returns 0 when aiport is empty" do
      expect(airport.count_planes).to eq 0
    end

    it "Loads 5 airplanes into the airport" do
      airport.load_planes(5)
      expect(airport.count_planes).to eq 5
    end
    
    it "Returns that the airport is not full" do
      is_full = airport.capacity_max?
      expect(is_full).to eq false
    end

    it "Returns that the airport is full" do
      airport.load_planes(5)
      # add 5 (default capacity) new planes to the airport
      is_full = airport.capacity_max?
      expect(is_full).to eq true
    end

    it "When the max capacity is overrided, it changes whether the airport is full accordingly" do
        airport.override_max_capacity(2)
        airport.load_planes(2)
        # add 2 new planes to the airport
        is_full = airport.capacity_max?
        expect(is_full).to eq true
    end

    it "Lets a plane be landed" do
      plane = Plane.new
      airport.land_plane(plane)
      was_successful = airport.in_airport?(plane)
      expect(was_successful).to eq true
    end

    it "Lets a plane take off" do 
      airport.load_planes(3)
      plane = airport.take_off_plane
      in_airport = airport.in_airport?(plane)
      expect(in_airport).to eq false
    end

end