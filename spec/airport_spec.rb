require 'airport'

describe Airport do
  it{ is_expected.to respond_to(:land).with(1).argument}
  it "allow planes to land" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it{ is_expected.to respond_to(:take_off).with(1).argument}
  it "allow to planes to take off" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq plane
  end

  it "returns landed planes" do
  plane = Plane.new
  subject.land(plane)
  expect(subject.plane).to eq plane

  end

end
