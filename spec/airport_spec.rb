require "airport"
require "plane"

describe Airport do
  it "can instruct plane to land" do
    plane1 = Plane.new
    expect(subject).to respond_to(:land)
    expect(subject.land(plane1)).to eq([plane1])
  end
  #   it { is_expected.to respond_to :land }
  it "can instruct a plane to take off from airport" do
    plane1 = Plane.new
    subject.land(plane1)
    expect(subject).to respond_to(:take_off)
    expect(subject.take_off(plane1)).to eq([])
  end
end
