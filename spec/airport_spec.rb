require 'airport'

describe Airport do
let (:plane) {double :plane}

    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it { is_expected.to respond_to(:planes)}


  describe "#land"
    it "Lands a Plane" do
      expect(subject.land(plane)).to eq plane
    end

    it "Can land more than one plane" do
      subject.land(plane)
      subject.land(plane)
      expect(subject.planes).to eq [planes]
    end

    it "Can tell us which planes have landed" do
      subject.land(plane)
      expect(subject.planes).to eq [planes]
    end

  describe "#take off"
    it "Allow a plane to take off" do
    expect(subject.take_off(plane)).to eq plane
  end

  #  it "has a default capacity of MAX_CAPACITY" do
  #    expect(subject.capacity).to eq Airport::MAX_CAPACITY
  #  end

  #  it "Raises an error when at capacity" do
#      Airport::MAX_CAPACITY.times { subject.land(plane) }
#      expect(subject.land(plane)).to raise_error "Airport full! No Planes can land"
#    end


end
