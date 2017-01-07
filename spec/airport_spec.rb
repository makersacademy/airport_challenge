require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land)}
    it { is_expected.to respond_to(:land).with(1).argument }

    it "stores the planes that are currently at the airport" do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
        expect(airport.arrivals).to include(plane)
    end
  end

  describe "#depart" do
    it { is_expected.to respond_to(:depart)}
    it { is_expected.to respond_to(:depart).with(1).argument }

    it "removes the departed plane from the list of arrivals following departure" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      airport.depart(plane)
      expect(airport.arrivals).not_to include(plane)
    end

    it "should retain a list of the departed flights" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      airport.depart(plane)
      expect(airport.departures).to include(plane)
    end
  end
end
