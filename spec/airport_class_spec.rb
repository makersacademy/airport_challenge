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
       # plane = Plane.new
       airport = Airport.new
       airport.stormy
      expect(airport.stormy).to eq("no landing stormy conditions")
      # allow(airport.stormy).to recieve(@weather).and return("stormy")
      end

  #     it "says what noise the thingie makes" do
  # thingie = double(:thingie, prod: "oi")
  # subject = Detective.new(thingie)
  #
  # result = subject.investigate
  #
  # expect(result).to eq "It went 'oi'"
end
  end

  describe "Airport capacity" do

    it "prevents #land when airport is at capacity" do
        # plane = Plane.new
      airport = Airport.new
        # subject.land(plane)
      airport.full
    expect{ airport.full }.to raise_error("airport is full")
    end
  end


end



# end
