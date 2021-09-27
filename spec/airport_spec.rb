require "airport"
require "weather"

describe Airport do
  describe "#hangar" do
    it "creates a hangar to store planes" do
      expect(subject.hangar).to eq []
    end
  end

  describe "#land" do
    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:land).with(2).arguments }

    it "lands plane and adds to hangar if weather is sunny" do
      plane = Plane.new
      sunny_weather = Weather.new
      allow(sunny_weather).to receive(:condition) { "Sunny" }
      subject.land(plane, sunny_weather)
      expect(subject.hangar.last).to eq plane
    end
    it "prevents landing plane if weather is stormy" do
      plane = Plane.new
      stormy_weather = Weather.new
      allow(stormy_weather).to receive(:condition) { "Stormy" }
      expect { subject.land(plane, stormy_weather) }.to raise_error "Weather is dangerous to land in"
    end
  end

  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff) }

    it "removes plane from hangar after taking off if weather is sunny" do
      plane = Plane.new
      sunny_weather = Weather.new
      allow(sunny_weather).to receive(:condition) { "Sunny" }
      subject.land(plane, sunny_weather)
      subject.takeoff(sunny_weather)
      expect(subject.hangar).not_to include plane
    end
    it "prevents plane taking off if weather is stormy" do
      plane = Plane.new
      sunny_weather = Weather.new
      allow(sunny_weather).to receive(:condition) { "Sunny" }
      subject.land(plane, sunny_weather)
      stormy_weather = sunny_weather
      allow(stormy_weather).to receive(:condition) { "Stormy" }
      expect { subject.takeoff(stormy_weather) }.to raise_error "Weather is dangerous to take off in"
    end
  end
end
