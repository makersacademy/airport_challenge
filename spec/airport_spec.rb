require './lib/airport'
require './lib/plane'

describe Airport do
  describe "Create airport" do
    it "Creates a new airport instance" do
      expect(Airport.new).to be_an_instance_of Airport
    end
  end

  describe "#land" do
    it "lands plane to hangar in airport" do
      plane = Plane.new
      allow(plane).to receive(:land)
      subject.land plane
      expect(subject.hangar).to include plane
    end

    it "throws error if hangar full" do
      plane = Plane.new
      allow(plane).to receive(:land)
      subject.land plane
      expect { subject.land(plane) }.to raise_error "No space available"
    end

    it "throws error if weather is stormy" do
      plane = Plane.new
      allow(plane).to receive(:land)
      allow(subject.weather).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "Cannot land due to stormy weather"
    end
  end

  describe "#take_off" do
    it "removes plane from hangar" do
      plane = Plane.new
      allow(plane).to receive(:take_off)
      subject.take_off plane
      expect(subject.hangar).not_to include plane
    end

    it "throws error if weather is stormy" do
      plane = Plane.new
      allow(plane).to receive(:take_off)
      allow(subject.weather).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error "Cannot take off due to stormy weather"
    end
  end
end
