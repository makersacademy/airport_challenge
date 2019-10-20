require "airport"

describe Airport do

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "takeoff method" do

    it "raises an error when airport is empty" do
      expect { subject.takeoff }.to raise_error "Airport is empty"
    end

    it "makes a plane take off" do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.takeoff).to be plane
    end

  end

  describe "land method" do

    it "raises an error when airport is full" do
      subject.capacity.times { subject.land(double :plane) }
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
