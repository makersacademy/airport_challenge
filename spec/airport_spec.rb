require './lib/airport'

describe Airport do
    let(:sunny) {1}
    let(:stormy) {2}
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
        plane1 = Plane.new
        plane2 = Plane.new
        subject.land(plane)
        subject.land(plane1)
      expect{ subject.land(plane2) }.to raise_error("No hangar space available")
      end
      it "throws error if same plane tries to land again while in hangar" do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("plane already landed")
      end
end
  describe "#takeoff" do
    let(:weather) { double("weather double", :generate => sunny) }

    it "allows the plane to takeoff from the hangar" do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.checkHangar).to eq([])
    end
end
  describe "capacity" do
    it "allocates the default capacity for the hangar as 4" do
      expect(subject.capacity).to eq(2)
    end
  end
  describe "weather" do
    let(:weather) { double("weather double", :generate => stormy) }

    it "prevents plane from taking off in stormy weather" do
      airport = Airport.new([], weather)
      plane = Plane.new
      subject.land(plane)
      expect{ subject.takeoff(plane) }.to raise_error("cannot takeoff due to stormy weather")
    end
end
end