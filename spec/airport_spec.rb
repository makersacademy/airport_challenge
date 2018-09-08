require 'airport'

describe Airport do
  it "has a working Airport#land(plane) method" do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end

  it "has a working Airport#take_off(plane) method" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq(plane)
  end
end
