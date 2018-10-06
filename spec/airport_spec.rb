require 'airport'
require 'pry'
describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  let(:subject) { Airport.new(Airport::DEFAULT_CAPACITY, weather) }

  before { allow(weather).to receive(:stormy?).and_return false }

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should have a capacity that can be changed" do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  describe "#land" do
    it "should instruct a plane to land" do
      expect(subject.land(plane)).to eq "Plane has landed"
    end

    it "should store the plane in the airport" do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end

    it "should raise error if planes are already in the airport" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane has already landed")
    end

    it "should raise when the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error("Cannot land in stormy weather")
    end

    it "should raise error when airport is full" do
      subject.capacity.times { airplane = double(:plane); subject.land(airplane) }
      expect { subject.land(plane) }.to raise_error("Airport is full!")
    end
  end

  describe "#takeoff" do
    it "should confirm plane is no longer at airport after takeoff" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.hangar).to eq []
    end

    it "should raise error if plane is not in airport" do
      expect { subject.takeoff(plane) }.to raise_error("Plane is not at airport")
    end

    it "should prevent takeoff when the weather is stormy" do
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error("Cannot takeoff in stormy weather")
    end
  end
end
