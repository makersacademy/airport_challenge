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

  describe "weather conditions and if/when planes can takeoff and land" do

      it "prevents takeoff if weather is stormy" do
        plane = Plane.new
        airport = Airport.new
        airport.takeoff(plane).stormy?
        expect(airport.takeoff(plane).stormy?).to respond_to("takeoff not allowed
          due to stormy conditions")
      end
  end

   # describe "Airport capacity" do
   #
   #    it "prevents #land when airport is at capacity" do
   #      plane = Plane.new
   #      airport = Airport.new
   #      #subject.land(plane)
   #      airport.full
   #      expect{ airport.full }.to raise_error("airport is full")
   #    end
   # end


end



# end
