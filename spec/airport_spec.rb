require './lib/airport'

describe Airport do
  describe "Create Airport" do
    it "It creates an airport instance" do
      airport = Airport.new
      expect(airport).to be_an_instance_of(Airport)
    end
  end
  describe "#land" do
    it "allows the plane to land at the airport" do
      #it { is_expected.to respond_to(:land).with(0).plane}
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
      it "rejects landing if hangar is full" do
        airport = Airport.new
        plane = Plane.new
        subject.land(plane)
      expect { subject.land(plane) }.to raise_error("No hangar space available")
      end
end
  describe "#takeoff" do
      it { is_expected.to respond_to(:takeoff) }
    end
end