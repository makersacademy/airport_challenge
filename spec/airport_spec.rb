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

#  context "when weather is not stormy" do

#    it "allows plane to take off when weather is not stormy" do
#      weather = double(:weather)
#      plane = double(:plane)
#      subject.land(plane)
#      allow(weather).to receive(:stormy) { false }
#      expect { subject.takeoff }.not_to raise_error
#    end

#  end

  describe "takeoff method" do

    it "raises an error when airport is empty" do
      expect { subject.takeoff }.to raise_error "Airport is empty"
    end

    it "makes a plane take off" do
      weather = double(:weather)
      plane = double(:plane)
      subject.land(plane)
      allow(weather).to receive(:stormy) { true }
      expect(subject.takeoff).to be plane
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
