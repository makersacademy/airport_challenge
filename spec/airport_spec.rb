require 'airport'
require 'plane'

describe Airport do
  subject { Airport.new(5) }

  it 'Creates an instance of Airport' do
    expect(subject).to be_instance_of Airport
  end

  it 'Will allow a plane to land' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.plane_capacity).to include(plane)
  end

  it 'will allow the user to change the max capacity' do
    expect(subject.max_capacity).to eq 5
  end

  it 'will set a default capacity if user does not define a capacity' do
    airport = Airport.new
    expect(airport.max_capacity).to eq Airport::DEFAULT_CAPACITY
  end
end
