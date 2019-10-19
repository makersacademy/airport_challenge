require 'airport'

describe Airport do
  context "When using the airport class" do
    it "should let planes land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end

    it "should let planes take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end

    it "should confirm if a plane is at the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_airport?(plane)).to be false
    end
  end
end