require "airport"

describe Airport do

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).argument}

    it "should show a plane has landed" do
      expect(subject.land(plane = Plane.new)).to include(plane)
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
      expect {subject.take_off(plane).to raise_error}
    end
  end

end
