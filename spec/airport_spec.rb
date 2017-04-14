require 'airport'
require 'plane'

describe Airport do
  it 'allows a plane to land' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to be_instance_of(Plane)
  end
end
