require 'airport'

describe Airport do

  describe "#land" do

    it "returns a message if a plane has landed" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "You have landed plane: #{plane}"
    end
  end


  describe "#take_off" do

    it "returns a message when the plane has taken off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq "The flight now leaving is: #{plane}"
    end

    it "raises an error if trying to take off in a storm" do
      plane = Plane.new
      subject.land(plane)
      expect{subject.take_off}.to raise_error "You cannot take off in a storm."
    end

  end

end
