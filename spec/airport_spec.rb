require "airport"
require "plane"

describe Airport do
  it "can instruct plane to land" do
    plane1 = Plane.new
    expect(subject).to respond_to(:land).with(1).argument
    expect(subject.land(plane1)).to eq([plane1])
  end
  #   it { is_expected.to respond_to :land }
  it "can instruct a plane to take off from airport" do
    plane1 = Plane.new
    subject.land(plane1)
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "can confirm that a plane has taken off and is not at airport" do
    plane1 = Plane.new
    subject.take_off(plane1)
    expect(subject.take_off(plane1)).to eq([])
    expect(subject.planes).not_to include(plane1) # need to use attr_accessor for planes
    expect(subject.confirm_takeoff(plane1)).to eq(false)
  end
end
