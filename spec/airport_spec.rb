require 'airport'
require 'plane'

describe Airport do
  it "responds to land_plane" do
    expect(subject).to respond_to(:land_plane)
  end

  it 'adds plane to the hangar if landing is approved' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.hangar).to include(plane)
  end
end
