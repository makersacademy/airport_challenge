require "airport.rb"

describe Airport do
  subject { Airport.new }
  let (:plane) { double :plane }

  describe "#landing" do
    it "airport instructed to land plane" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "instruct to land plane, airport contains plane" do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it "no landing when weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Stormy - no plane movements at airport"
    end

    it 'no landing when aiport is full - set capacity' do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:land)
      allow(subject).to receive(:capacity) { 1 }
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Airport full - no landing"
    end

  end

  describe "#take-off" do
    it "airport instructed to have plane take off" do
      allow(subject).to receive(:weather) { "sunny" }
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "instruct to take off plane and plane has left airport" do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:takeoff)
      subject.planes << plane
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

    it "no take-off when weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.takeoff(plane) }.to raise_error "Stormy - no plane movements at airport"
    end

    it "plane cannot take off from airport it it is not at the specified airport" do
      allow(subject).to receive(:weather) { "sunny" }
      expect { subject.takeoff(plane) }.to raise_error "Specified plane not at airport"
    end

  end

end
