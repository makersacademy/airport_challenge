require 'airport'
require 'plane'

describe Airport do
  subject { Airport.new }

  it 'Creates an instance of Airport' do
    expect(subject).to be_instance_of Airport
  end

  it 'Will allow a plane to land' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.plane_capacity).to include(plane)
  end
end
