require 'airport'

RSpec.describe Airport do
  describe "#land" do
    it "should tell a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe "#take_off" do
    it "should tell a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "should check the plane is gone" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "capacity" do
    it "has a capacity" do
      subject.land(Plane.new)
      expect(subject.planes.length).to be 1
    end
  end
end