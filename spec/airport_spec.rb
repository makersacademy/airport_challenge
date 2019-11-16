require "airport"
require "plane"

describe Airport do
  describe "#land" do
    #Land a plane
    it "should land a plane at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
    end
  end

  describe "#refuse_landing" do
    #Raise error when the airport is full
    it "should raise error when the airport is full" do
    30.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error ("The airport is full")
    end
  end

  describe "＃take_off" do
    #A plane to take off
    it "should instuct a plane to take off" do
    expect(subject).to respond_to(:take_off)
    end
  end

  describe "#comfirm" do
    #Confirm the takeoff
    it "should confirm if the plane has taken off" do
    expect(subject.takeoff?).to eq(true)
    end
  end
end