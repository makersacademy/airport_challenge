require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it "should respond to land" do
      expect(subject).to respond_to(:land)
    end
    it "should return a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
    it "raises an error when plane has already landed" do
      subject.land Plane.new
      expect{ subject.land Plane.new }.to raise_error "plane already landed"
    end
  end

  describe '#take_off' do
    it "should respond to take off" do
      expect(subject).to respond_to(:take_off)
    end
    it "should allow a plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end
    it "should raise an error if plane has already taken off" do
      expect{ subject.take_off }.to raise_error "plane already taken off"
    end
  end
end
