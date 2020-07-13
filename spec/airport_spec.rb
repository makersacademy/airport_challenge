require 'airport'
describe Airport do
  it 'can land a plane' do
    plane = double(:plane)
    expect(subject.land(plane)).to include(plane)
  end
  it 'can allow a plane to takeoff' do
    plane = double(:plane)
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq(plane)
  end
  it 'removes a plane from the airport once it has taken off' do
    plane = double(:plane)
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include(plane)
  end
  it 'has a default capacity of planes' do
    plane = double(:plane)
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Airport is at maximum capacity"
  end
  it 'has a capacity that can be set when initialized' do
    airport = Airport.new(30)
    plane = double(:plane)
    30.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Airport is at maximum capacity"
  end
end
