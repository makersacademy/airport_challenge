require './lib/airport'

describe Airport do
  subject(:airport) { Airport.new }

  describe "Create Airport" do
    it "It creates an airport instance" do
      expect(subject).to be_an_instance_of(Airport)
    end
  end
  describe "#land" do
    it "allows the plane to land at the airport" do
      #it { is_expected.to respond_to(:land).with(1).argument}
      plane = Plane.new
      expect(subject.land(plane)).to include plane
    end
      it "rejects landing if hangar is full" do
        plane = Plane.new
        subject.land(plane)
      expect { subject.land(plane) }.to raise_error("No hangar space available")
      end
end
  describe "#takeoff" do
    it "allows the plane to takeoff from the hangar" do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.checkHangar).to eq([])
    end
end
end