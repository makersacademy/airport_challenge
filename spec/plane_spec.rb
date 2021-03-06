require 'plane'
require 'airport'

describe Plane do
  test_airport = Airport.new("ABC")
  test_plane = Plane.new("AB123", test_airport, test_airport)

  it "returns a callsign" do
    expect(subject.callsign).to be_a(String)
  end

  context "in response to a request for location" do
    it "responds with its origin code if in_flight == false" do
      expect(test_plane.location.length).to eq(3)
    end
    it "responds with a string message when in flight" do
      test_airport = Airport.new("ABC")
      test_airport.local_weather(:clear)
      subject.takeoff(test_airport)
      expect(subject.location).to be_a(String)
    end
  end
  
  it "must have an origin and destination that are of the class Airport" do
    expect(subject.origin).to be_a(Airport)
    expect(subject.destination).to be_a(Airport)
  end

  it "must report its flying status as true or false" do
    expect(subject.in_flight).to be(true).or be(false)
  end
  
  context "when the airport weather is good for landing and takeoff a plane" do
    test_airport.local_weather(:clear)
    it "is able to land at a given airport" do
      expect(test_airport.safe_to_land?).to eq(true)
    end
    it "is able to takeoff at a given airport" do
      expect(test_airport.safe_to_takeoff?).to eq(true)
    end
  end

  context "the plane's in_flight status must" do
    it "be true when the plane has taken off" do
      subject.origin = test_airport
      allow(test_airport).to receive(:rand).and_return(10)
      subject.takeoff(test_airport)
      expect(subject.in_flight).to eq(true) 
    end
    it "be false when the plane has landed" do
      test_airport.local_weather(:clear)
      subject.takeoff(test_airport)
      subject.land(test_airport)
      expect(subject.in_flight).to eq(false)
    end
  end

  context "when a plane is already in flight it" do 
    it "cannot be given the order to take off and it returns an error" do
      allow(test_airport).to receive(:rand).and_return(10)
      test_plane.takeoff(test_airport)
      expect { test_plane.takeoff(test_airport) }.to raise_error("This callsign is already in flight")
    end
  end
end
