require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:land).with(1).argument }
  # context "a plane is ready to land at an empty airport" do
  #   plane = Object.new
  #   # subject.land(plane)
  #   it "should store a plane in the airports planes variable" do
  #     expect(subject.plane).to eq plane
  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  it "stores a plane" do
    plane = Plane.new
    subject.land(plane)
    expect.(subject.plane).to eq plane
  end
end
