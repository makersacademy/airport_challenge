require 'plane'


class MockSunny
  def weather
    "sunny"
  end
end

describe Plane do
let(:airport) {double :airport}
  describe "#inflight" do
    it "should give me the status of the airplane" do
      expect(subject.in_flight).to be false
    end

    it "should initialize with a status" do
      expect(Plane.new.in_flight?).to eq false
    end

    it "should change status when plane lands" do
      stub_const("Weather", MockSunny)
      allow(airport).to receive(:take_off).and_return("#{subject} has taken off")
      allow(airport).to receive(:land).and_return("The plane has landed")
      airport.take_off(subject)
      airport.land(subject)
      expect(subject.in_flight?).to eq false
    end

  end

end
