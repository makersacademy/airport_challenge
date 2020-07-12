require 'airport'
describe Airport do
  it 'can land a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to include(plane)
  end
  it 'can allow a plane to takeoff' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq(plane)
  end
  it 'removes a plane from the airport once it has taken off' do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include(plane)
  end
  it 'has a default capacity of planes' do
    (Airport::DEFAULT_CAPACITY).times {subject.land(Plane.new)}
    expect { subject.land(Plane.new) }.to raise_error "Airport is at maximum capacity"
  end
  it 'has a capacity that can be set when initialized' do
    airport = Airport.new(30)
    30.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport is at maximum capacity"
  end
end
