require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  let(:subject) { Airport.new(Airport::DEFAULT_CAPACITY, weather) }

  before {
    allow(weather).to receive(:stormy?).and_return false;
    allow(plane).to receive(:landed?).and_return false;
    allow(plane).to receive(:land).and_return true
    allow(plane).to receive(:fly).and_return true
  }

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should have a capacity that can be changed" do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  describe "#land" do
    it "should store the plane in the airport" do
      subject.land(plane)
      expect(subject.hangar).to eq "#{plane}"
    end

    context "when planed is already at the airport" do
      it "should not land again" do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("Plane is already in the hangar")
      end
    end

    context "when stormy" do
      it "should prevent landing" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }.to raise_error("Cannot land in stormy weather")
      end
    end

    context "when airport is full" do
      it "should not allow plane to land" do
        subject.capacity.times {
          airplane = double(:plane);
          allow(airplane).to receive(:landed?).and_return false;
          allow(airplane).to receive(:land).and_return true;
          subject.land(airplane)
        }
        expect { subject.land(plane) }.to raise_error("Airport is full!")
      end
    end

    context "when a plane has already landed" do
      it "should not land again" do
        allow(plane).to receive(:landed?).and_return true
        expect { subject.land(plane) }.to raise_error("This plane has already landed")
      end
    end
  end

  describe "#takeoff" do
    it "should confirm plane is no longer at airport after takeoff" do
      allow(plane).to receive(:flying?).and_return false
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.hangar).to eq "Hangar is empty"
    end

    context "when stormy" do
      it "should prevent takeoff" do
        subject.land(plane)
        allow(weather).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:flying?).and_return false
        expect { subject.takeoff(plane) }.to raise_error("Cannot takeoff in stormy weather")
      end
    end

    context "when the plane is already flying" do
      it "should not takeoff again" do
        allow(plane).to receive(:flying?).and_return true
        expect { subject.takeoff(plane) }.to raise_error("This plane is already flying")
      end
    end
  end
end
