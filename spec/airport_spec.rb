require "airport"

describe Airport do

  let(:plane) { Plane.new }
  let(:weather) { instance_double(Weather) }

  describe "initialize" do
    it "allows a default capacity to be set" do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end
  end

  describe "land" do
    it "makes sure the airport allows a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "stores a landed plane in the airport" do
      allow(Weather).to receive(:new) {weather}
      allow(weather).to receive(:stormy?) { "sunny" }
      expect(subject.land(plane)).to eq([plane])
    end

    it "prevents landing when the airport is full" do
      allow(Weather).to receive(:new) {weather}
      allow(weather).to receive(:stormy?) { "sunny" }
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "This airport is currently at maximum capacity"
    end

    it "doesn't allow landing during a storm" do
      allow(Weather).to receive(:new) {weather}
      allow(weather).to receive(:stormy?) { "stormy" }
      expect { subject.land(plane) }.to raise_error "It is too stormy"
    end
  end

  describe "takeoff" do
    it "allows planes to takeoff" do
      expect(subject).to respond_to(:takeoff)
    end

    it "checks that a plane is no longer in the airport" do
      allow(Weather).to receive(:new) {weather}
      allow(weather).to receive(:stormy?) { "sunny" }
      subject.land(plane)
      subject.takeoff
      expect(subject.planes).to eq([])
    end

    it "doesn't allow planes to take off during a storm" do
      allow(Weather).to receive(:new) {weather}
      allow(weather).to receive(:stormy?) { "sunny" }
      test = Weather.new(weather)
      subject.land(plane)
      allow(weather).to receive(:stormy?) { "stormy" }
      expect { subject.takeoff }.to raise_error "It is too stormy"
    end
  end

  describe "takeoff & land" do
    it "lands and takes off multiple planes" do
      allow(Weather).to receive(:new) {weather}
      allow(weather).to receive(:stormy?) { "sunny" }
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      Airport::DEFAULT_CAPACITY.times { subject.takeoff }
      expect(subject.planes).to eq([])
    end
  end

end


# it "doesn't allow planes to take off during a storm" do
#   allow(subject).to receive(:checks_safety) { "sunny" }
#   subject.land(plane)
#   allow(subject).to receive(:checks_safety) { "stormy" }
#   expect { subject.takeoff }.to raise_error "It is too stormy"
# end