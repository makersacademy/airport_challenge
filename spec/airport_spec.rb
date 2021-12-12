require 'airport'
require 'plane'
require 'weather'

describe Airport do
  clear_airport = Airport.new(Airport::DEFAULT_CAPACITY, :clear)
  stormy_airport = Airport.new(Airport::DEFAULT_CAPACITY, :stormy)
  plane = Plane.new
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'keeps a record of planes that have landed' do
    clear_airport.land(plane)
    expect(clear_airport.hangar).to include(plane)
  end

  it 'removes plane that takes off from planes array' do
    clear_airport.land(plane)
    clear_airport.takeoff(plane)
    expect(clear_airport.hangar).to_not include(plane)
  end

  it 'raises error if a plane tries to land at a full airport' do
    full_airport = Airport.new(0, :clear)
    message = 'No clearance to land: Airport is full'
    expect { full_airport.land(plane) }.to raise_error message
  end

  it 'raises error if a plane has failed to leave the hangar' do
    clear_airport.land(plane)
    message = 'Alert: Plane is still in hangar'
    expect { clear_airport.confirm_takeoff(plane) }.to raise_error message
  end

  it 'prints message to confirm plane has left hangar' do
    clear_airport.land(plane)
    clear_airport.takeoff(plane)
    message = "#{plane} has successfully taken off"
    expect { clear_airport.confirm_takeoff(plane) }.to output(message).to_stdout
  end

  it 'allows default capacity to be overridden' do
    big_airport = Airport.new(100)
    expect { big_airport.size != Airport::DEFAULT_CAPACITY }
  end

  it 'prevents takeoff when weather is stormy' do
    message = 'No clearance for takeoff: Stormy weather'
    expect { stormy_airport.takeoff(plane) }.to raise_error message
  end

  it 'prevents landing when weather is stormy' do
    allow(plane).to receive(:flying?) { false }
    message = 'No clearance to land: Stormy weather'
    expect { stormy_airport.land(plane) }.to raise_error message
  end

  it 'raises error when grounded plane tries to land' do
    allow(plane).to receive(:flying?) { false }
    message = 'No clearance to land: Plane isn\'t in flight'
    expect { clear_airport.land(plane) }.to raise_error message
  end

  it 'prevents non-planes from landing' do
    string = "I am not a plane"
    allow(string).to receive(:flying?) { true }
    message = 'No clearance to land: Object is not a plane'
    expect { subject.land(string) }.to raise_error message
  end
end
