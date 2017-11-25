require "airport"

describe Airport do

  describe "#initialize" do
    it "should ensure that the default capacity is set to 10" do
      expect(subject.capacity).to eq 10
    end

    it "should allow the user to set the capacity" do
      expect(Airport.new(20).capacity).to eq 20
    end
  end

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).argument}

    it "should show a plane has landed" do
      expect(subject.land(plane = Plane.new)).to include(plane)
    end

    it "should raise an error if the plane is already in the airport" do
      subject.land(plane = Plane.new)
      expect {subject.land(plane)}.to raise_error("Plane already in aiport")
    end

    it "should raise an error if the aiport is full" do
      Airport::DEFAULT_CAPACITY.times {subject.land(plane = Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error("Airport full")
    end
  end

  describe "#take_off" do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it "should allow a plane to take off" do
      plane =  Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq (subject.planes)
    end

    it "should raise an error if the plane is not in the aiport" do
      plane =  Plane.new
      expect {subject.take_off(plane)}.to raise_error("Plane not in airport")
    end
  end

end
