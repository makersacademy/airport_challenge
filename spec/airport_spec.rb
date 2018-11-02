require 'airport'

describe Airport do
  let(:plane) { double("plane") }
  # let(:airport) { double("stormy airport", :land => true, :take_off => true, :stormy? => false, :stormy_weather => false) }
  # let(:stormy_airport) { double("stormy airport", :land => true, :take_off => false, :stormy? => true, :stormy_weather => true) }
  # let(:sunny_airport) {double("sunny airport", :land => true, :take_off => true, :stormy => false)}

  context "#land" do
    it "is able to land a plane at the airport" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  context "#take_off" do
    it "allows a plane to take off from the airport" do
      subject.stormy_weather = false
      subject.take_off(plane)
      expect(subject.planes).to_not include(plane)
    end

    it "prevent take off if weather is stormy" do
      subject.stormy_weather = true
      expect { subject.take_off(plane) }.to raise_error "Weather is stormy"
    end
  end
end
