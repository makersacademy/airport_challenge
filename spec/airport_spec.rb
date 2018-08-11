require "airport"

describe Airport do
  let(:plane) { double :plane }
  let(:weather_stormy) { double :weather, :stormy? => true }
  # let(:weather_sunny) { double :weather :stormy? => false}
  describe "#land" do
    it "lands a plane" do
      expect(subject.land(plane)).to eq plane
    end
  end
  describe "#takeoff" do
    it "takes off a plane" do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
    # it "won't take off in stormy weather" do
    #   subject.land(plane)
    #   expect{subject.takeoff(plane, weather_stormy)}.to raise_error "Stormy weather, can't take off"
    # end
  end
  describe "#planes" do
    it "returns the plane in an airport" do
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
    it "confirms plane is no longer at the airport" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.plane).to eq nil
    end
  end
end
