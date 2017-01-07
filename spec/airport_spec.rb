require 'airport'

describe Airport do

  describe "tests relating to planes landing" do

    it "responds to the method 'land'" do
      expect(subject).to respond_to(:land)
    end

    it "takes a plane as an argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "stores the planes that are currently at the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.arrivals).to include(plane)
    end
  end

  describe "tests relating to planes taking off" do

    it "should respond to the method depart" do
      expect(subject).to respond_to(:depart)
      end

    it "should take a plane as an argument" do
      expect(subject).to respond_to(:depart).with(1).argument
    end

    it "should remove the plane from the list of parked planes after take off" do
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
