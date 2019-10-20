require "airport"

describe Airport do

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  context "when weather is stormy" do

    it "prevents plane taking off when weather is stormy" do
      weather = double(:weather)
      plane = double(:plane)
      subject.land(plane)
      allow(weather).to receive(:stormy).and_return(true)
      expect { subject.takeoff }.to raise_error "Cannot take off in stormy weather"
    end

  end

  describe "takeoff method" do

    it "raises an error when airport is empty" do
      expect { subject.takeoff }.to raise_error "Airport is empty"
    end

    it "makes a plane take off" do
      weather = double(:weather, :stormy => false)
      plane = double(:plane)
      subject.land(plane)
      allow(weather).to receive(:stormy).and_return(false)
      expect(weather.stormy).to be false
      weather.stormy
      expect(subject.takeoff).to eq plane
    end

  end

  describe "land method" do

    it "raises an error when airport is full" do
      plane = double(:plane)
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(double :plane) }.to raise_error "Airport is full"
    end

    it "lands a plane and returns landed plane" do
      plane = double(:plane)
      expect(subject.land(plane)).to eq [plane]
    end

    it "returns the plane that just landed" do
      plane = double(:plane)
      expect(subject.land(plane)).to eq ([plane])
    end

  end

  describe "report method" do

    it "shows the current planes in the airport" do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.report).to eq ([plane])
    end

  end

end
