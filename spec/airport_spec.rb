require "airport"

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather, :stormy? => true }
  # let(:weather_sunny) { double :weather :stormy? => false}
  describe "#land" do
    it "lands a plane" do
      expect(subject.land(plane)).to eq plane
    end
    it "won't allow a plane to land if the airport is full" do
      5.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "This airport is full"
    end
    it "won't allow a plane to land if the weather is stormy" do
      expect{subject.land(plane, weather.stormy?)}.to raise_error "Stormy weather, can't land"
    end
    it "allows planes to be landed up to the airport capacity" do
      sub2 = Airport.new(10)
      9.times {sub2.land(plane)}
      expect(sub2.land(plane)).to eq plane
    end
  end
  describe "#takeoff" do
    it "takes off a plane" do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
    it "won't take off in stormy weather" do
      subject.land(plane)
      expect{subject.takeoff(plane, weather.stormy?)}.to raise_error "Stormy weather, can't take off"
    end
  end
  describe "#planes" do
    it "returns the plane in an airport" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
    it "confirms plane is no longer at the airport" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).to eq []
    end
  end
  describe "#initialize" do
    it "Allows users to setup airports with custom capacity" do
      expect(Airport.new(5)).to be_a Airport
    end
  end
end
