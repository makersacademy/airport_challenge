require 'plane'
require 'airport'

describe Plane do
  test_airport = Airport.new

  it "is able to report its location" do
    expect(subject.location).to eq("location")
  end
  
  it "must have an origin and destination that are of the class Airport" do
    expect(subject.origin).to be_a(Airport)
    expect(subject.destination).to be_a(Airport)
  end

  it "must report its flying status as true or false" do
    expect(subject.in_flight).to be(true).or be(false)
  end
  
  context "the airport weather is good for landing and takeoff" do
    test_airport.local_weather(:clear)
    it "is able to land at a given airport" do
      expect(test_airport.safe_to_land?).to eq(true)
    end
    it "is able to takeoff at a given airport" do
      expect(test_airport.safe_to_takeoff?).to eq(true)
    end
  end
  
end
