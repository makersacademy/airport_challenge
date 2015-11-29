require 'airport'

describe Airport do
let (:plane) {double :plane}

    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it { is_expected.to respond_to(:planes)}


  describe "#land" do
    it "Lands a Plane" do
      expect(subject.land(plane)).to eq [plane]
    end

    it "Can tell us which planes have landed" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "Raises an error when at capacity" do
        subject.land(plane)
        expect {Airport::MAX_CAPACITY.times do
          subject.land(plane) end}.to raise_error "Airport full! No Planes can land"
    end


  describe "#take off" do
    it "Allow a plane to take off" do
    expect(subject.take_off(plane)).to eq plane
    end
  end
end

#  it "has a default capacity of MAX_CAPACITY" do
#    expect(subject.capacity).to eq Airport::MAX_CAPACITY
#  end




end
