require 'airport'

describe Airport do
  describe "#initialization" do
    it "should have a variable capacity" do
      airport = Airport.new(3)
      expect(airport.capacity).to eq(3)
    end
  end

  describe "#capacity" do
    it "should have a default capacity" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

  describe "#full?" do
    it "should return a truthy value when airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.planes << double(:plane) }
      expect(subject.full?).to be_truthy
    end

    it "should return a falsey value when airport is not full" do
      expect(subject.full?).to be_falsey
    end

    it "should return a falsey value after a plane has taken off" do
      plane = Plane.new
      plane.land(subject)
      plane.take_off
      expect(subject.full?).to be_falsey
    end
  end

  describe "#planes" do
    it { is_expected.to respond_to(:planes) }

    it "should return the planes which have landed there" do
      plane = double(:plane)
      subject.planes << plane
      expect(subject.planes).to eq([plane])
    end
  end
end
