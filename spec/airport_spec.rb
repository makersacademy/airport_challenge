require 'airport'

describe Airport do
  describe "#full?" do
    it "should return a truthy value when airport is full" do
      subject.plane = double(:plane)
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

  describe "#plane" do
    it { is_expected.to respond_to(:plane) }

    it "should return the plane which has landed" do
      plane = double(:plane)
      subject.plane = plane
      expect(subject.plane).to eq(plane)
    end
  end
end
