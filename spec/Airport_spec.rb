require 'Airport'
require 'Plane'

describe Airport do

    it "checks to see if a plane is in the airport" do
      airport = Airport.new
      plane = Plane.new
      result = airport.in_airport?(plane)
      # Create new plane and ask airport if it is in the airport
      expect(result).to eq false
    end
   
    it "lets a plane be landed" do
        airport = Airport.new
        plane = Plane.new
        airport.land_plane(plane)
        was_successful = airport.in_airport?(plane)
        expect(was_successful).to eq true
    end

   
end