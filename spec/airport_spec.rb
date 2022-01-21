require 'airport'

describe Airport do
  it "lands a plane" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to eq([plane])
  end

  it "takes off a plane" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff_plane).to eq(plane)
  end
end