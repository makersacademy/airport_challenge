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

  it 'will allow the user to change the max capacity' do
    airport = Airport.new(5)
    expect(airport.max_capacity).to eq 5
  end
end
