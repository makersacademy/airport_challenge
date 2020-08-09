require 'airport'

describe Airport do

  it "airport exists" do
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
  end

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "capacity can be changed" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it "should raise error if airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end

    it "should raise error if plane already landed" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane not flying")
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "allows a plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

  describe "#planes" do
    it { is_expected.to respond_to(:planes) }

    it "returns planes at airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

end
