require 'airport'

describe Airport do

  it "airport exists" do
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it "should raise error if airport is full" do
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off) }

    it "allows a plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

  describe "#plane" do
    it { is_expected.to respond_to(:plane) }

    it "returns plane if at airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
  end

end
