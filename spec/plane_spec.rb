require 'plane'
require 'airport'

class MockSunny
  def weather
    "sunny"
  end
end

describe Plane do

  describe "#inflight" do
    it "should give me the status of the airplane" do
      expect(subject.in_flight).to be false
    end

    it "should initialize with a status" do
      expect(Plane.new.in_flight?).to eq false
    end

    it "should change status when plane lands" do
      stub_const("Weather", MockSunny)
      airport = Airport.new
      airport.take_off(subject)
      airport.land(subject)
      expect(subject.in_flight?).to eq false
    end

  end

end
