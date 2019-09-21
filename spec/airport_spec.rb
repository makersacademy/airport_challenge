require "airport"

describe Airport do

  it "responds to land" do
    expect(subject).to respond_to :land_plane
  end

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it "allows a plane to takeoff and removes it from the airport" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff).to eq plane
  end

end
