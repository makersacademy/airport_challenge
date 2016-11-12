require 'airport'

describe Airport do

  it "responds to land_plane" do
    expect(subject).to respond_to :land_plane
  end

  it "allows controller to land a plane" do
    plane = Plane.new
    expect(subject.land_plane(plane))
  end

end
