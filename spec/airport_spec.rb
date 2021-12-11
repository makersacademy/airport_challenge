require 'airport'
require 'plane'

describe Airport do
  airport = Airport.new
  plane = Plane.new

  it { is_expected.to respond_to(:confirm_takeoff) }
  it { is_expected.to respond_to(:full?) }
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'raises error if a plane tries to land at a full airport' do
    10.times { airport.land(plane) }
    message = 'No clearance to land: Airport is full'
    expect { airport.land(plane) }.to raise_error message
  end

  it 'allows default capacity to be overridden' do
    airport = Airport.new(20)
    20.times { airport.land Plane.new }
    message = 'No clearance to land: Airport is full'
    expect { airport.land(plane) }.to raise_error message
  end

end
