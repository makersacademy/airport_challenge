require 'airport'

describe Airport do
  it "has a working Airport#land(plane) method" do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end
end
