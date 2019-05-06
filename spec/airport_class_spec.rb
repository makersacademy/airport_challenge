require 'airport_class'

describe Airport do

  describe "landing and takeoff of a plane in the airport" do

      it "lands a plane in the airport through #land" do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
        expect(airport.land(plane)).to eq("#{plane} has landed")
      end

      it "plane takesoff from the airport through #takeoff" do
        plane = Plane.new
        airport = Airport.new
        airport.takeoff(plane)
        expect(airport.takeoff(plane)).to eq("#{plane} has takenoff")
      end

  end

end



# end
