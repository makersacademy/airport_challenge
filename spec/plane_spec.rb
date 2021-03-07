require 'plane'
require 'airport'

describe Plane do
  test_airport = Airport.new("ABC")
  test_plane = Plane.new("AB123", test_airport, test_airport)

  context "upon creation" do
    it "must return a callsign" do
      expect(subject.callsign).to be_a(String)
    end

    it "must have an origin and destination that are of the class Airport" do
      expect(subject.origin).to be_a(Airport)
      expect(subject.destination).to be_a(Airport)
    end

    it "must report its flying status as true or false" do
      expect(subject.in_flight).to be(true).or be(false)
    end
  end

  context "in response to a request for location" do
    it "must respond with its origin code if landed at an airport" do
      expect(test_plane.location.length).to eq(3)
    end
    it "must respond with a string message when in flight" do
      allow(test_airport).to receive(:rand).and_return(1)
      test_plane.takeoff(test_airport)
      expect(test_plane.location).to be_a(String)
      test_plane.land(test_airport)
    end
  end
    
  context "when the airport weather is good for landing and takeoff" do
    it "is able to land at a given airport" do
      allow(test_airport).to receive(:rand).and_return(1)
      expect(test_airport.safe_to_manoeuvre?).to eq(true)
    end
    it "is able to takeoff at a given airport" do
      allow(test_airport).to receive(:rand).and_return(1)
      expect(test_airport.safe_to_manoeuvre?).to eq(true)
    end
  end

  context "must report its in_flight status as" do
    it "true when the plane has taken off" do
      subject.origin = test_airport
      allow(test_airport).to receive(:rand).and_return(1)
      subject.takeoff(test_airport)
      expect(subject.in_flight).to eq(true) 
    end
    it "false when the plane has landed" do
      subject.origin = test_airport
      allow(test_airport).to receive(:local_weather) { :clear }
      subject.takeoff(test_airport)
      allow(test_airport).to receive(:local_weather) { :clear }
      subject.land(test_airport)
      expect(subject.in_flight).to eq(false)
    end
  end

  context "when landed" do
    it "must return an error if ordered to land" do
      allow(test_airport).to receive(:rand).and_return(1)
      expect { test_plane.land(test_airport) }.to raise_error("This callsign has already landed")
    end
    it "must return an error if ordered to takeoff and the weather at origin is :stormy" do
      allow(test_airport).to receive(:rand).and_return(6)
      expect { test_plane.takeoff(test_airport) }.to raise_error("The weather prevents take off")
    end
  end

  context "when in flight" do 
    it "must return an error if given order to take off" do
      allow(test_airport).to receive(:rand).and_return(1)
      test_plane.takeoff(test_airport)
      expect { test_plane.takeoff(test_airport) }.to raise_error("This callsign is already in flight")
    end
    it "must return an error if ordered to land and the weather at destination is :stormy" do
      allow(test_airport).to receive(:rand).and_return(6)
      expect { test_plane.land(test_airport) }.to raise_error("The weather prevents landing")
    end
    it "must return an error if ordered to land and the airport destination is at capacity" do
      allow(test_airport).to receive(:rand).and_return(1)
      allow(test_airport).to receive(:at_capacity?).and_return(true)
      expect { test_plane.land(test_airport) }.to raise_error("The airport is at capacity, enter the holding circuit")
    end
  end
end
