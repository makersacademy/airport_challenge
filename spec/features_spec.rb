require "airport"

describe "Feature Test" do
  context "in good weather" do
    it "planes land and take off at multiple airports" do
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)

      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new

      airport1 = Airport.new(5, weather)
      airport2 = Airport.new(10, weather)

      airport1.land_plane(plane1)
      airport1.land_plane(plane2)

      plane2 = airport1.take_off(plane2)
      airport2.land_plane(plane2)
      airport2.land_plane(plane3)
    end
  end

  context "in bad weather" do
    it "everything grinds to a halt" do
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)

      plane1 = Plane.new
      plane2 = Plane.new

      airport = Airport.new(5, weather)

      expect do
        airport.land_plane(plane1)
      end.to raise_error(Airport::ERROR[:stormy])

      expect do
        airport.land_plane(plane2)
      end.to raise_error(Airport::ERROR[:stormy])
    end
  end
end
