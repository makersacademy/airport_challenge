require 'plane'

describe Plane do
  it 'should be an instance of plane' do
    expect(subject).to be_an_instance_of Plane
  end
  it 'can land at an airport' do
    airport_planes = []
    airport = double(:airport, planes: airport_planes)
    subject.land_at(airport)
    expect(airport.planes.include? subject).to eq true
  end
  it 'can take off and confirm that it is no longer in the airport' do
    airport_planes = [subject]
    airport = double(:airport, planes: airport_planes)
    subject.take_off
    expect(airport.planes.include? subject).to eq false
  end
end