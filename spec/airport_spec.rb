require 'airport'

describe Airport do

  it "responds to land_plane" do
    expect(subject).to respond_to :land_plane
  end

  it "allows controller to land a plane" do
    plane = Plane.new
    expect(subject.land_plane(plane))
  end

  it "responds to landed?" do
    expect(subject).to respond_to :landed?
  end

  it "returns if a plane has landed" do
    plane = Plane.new
    expect(subject.landed?(plane)).to eq true
  end

  

end
