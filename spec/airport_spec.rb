require 'airport'
describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land_plane) }
  it "tells a plane to land" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(plane).to eq subject.planes.last
  end

  it "confirms that a plane is landed there" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.landed?(plane)).to eq true
  end

  it "informs if the plane is not landed at this airport" do
    expect(subject.landed?(Plane.new)).to eq false
  end

end
