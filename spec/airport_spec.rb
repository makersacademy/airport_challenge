require 'airport'
require 'plane'
describe Airport do
  it 'instructs a plane to land' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end
  it 'confirms that plane has landed' do
    expect(subject.land_plane(Plane.new)).to be_landed
  end
  it 'instructs a plane to depart' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.depart_plane(plane)).to eq plane
  end
  it 'confirms that plane departured' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.depart_plane(plane)).to be_departed
  end
end
