require 'plane'
require 'airport'

class MockSunny
  def weather
    "sunny"
  end
end

describe Plane do

  describe "#status" do
    it "should give me the status of the airplane" do
      expect(subject.status).to eq ("in flight")
    end

    it "should initialize with a status" do
      expect(Plane.new.status).to eq ("in flight")
    end

    it "should change status when plane lands" do
      stub_const("Weather", MockSunny)
      airport = Airport.new
      airport.land(subject)
      expect(subject.status).to eq("landed")
    end
  end

end
