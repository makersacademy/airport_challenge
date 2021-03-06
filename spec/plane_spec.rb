require 'plane'
require 'airport'

describe Plane do
  test_airport = Airport.new

  context "in response to a request for location" do
    it "responds with its origin if in_flight == false" do
      expect(subject.location).to be_a(Airport)
    end
    it "responds with a string message when in flight" do
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

  context "a plane's in_flight status must" do
    it "be true when the plane has taken off" do
      subject.takeoff(test_airport)
      expect(subject.in_flight).to eq(true) 
    end
    it "be false when the plan has landed" do
      subject.takeoff(test_airport)
      subject.land(test_airport)
      expect(subject.in_flight).to eq(false)
    end
  end
end
