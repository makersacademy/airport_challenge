require 'airport'
require 'plane'
require 'weather'

describe Airport do
  airport = Airport.new
  plane = Plane.new

  #it { is_expected.to respond_to(:confirm_takeoff) }
  #it { is_expected.to respond_to(:full?) }
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'keeps a record of planes that have landed' do
    subject.land(plane)
    expect(subject.hangar).to include(plane)
  end

  it 'removes plane that takes off from planes array' do
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.hangar).to_not include(plane)
  end

  it 'raises error if a plane tries to land at a full airport' do
    10.times { airport.land(plane) }
    message = 'No clearance to land: Airport is full'
    expect { airport.land(plane) }.to raise_error message
  end

  it 'raises error if a plane has failed to leave the hangar' do
    subject.land(plane)
    message = 'Alert: Plane is still in hangar'
    expect { subject.confirm_takeoff(plane) }.to raise_error message
  end

  it 'prints message to confirm plane has left hangar' do
    subject.land(plane)
    subject.takeoff(plane)
    message = "#{plane} has successfully taken off"
    expect { subject.confirm_takeoff(plane) }.to output(message).to_stdout
  end

  it 'allows default capacity to be overridden' do
    airport = Airport.new(20)
    20.times { airport.land Plane.new }
    message = 'No clearance to land: Airport is full'
    expect { airport.land(plane) }.to raise_error message
  end

  it 'prevents takeoff when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    message = 'No clearance for takeoff: Stormy weather'
    expect { subject.takeoff(plane) }.to raise_error message
  end

  it 'prevents landing when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    message = 'No clearance to land: Stormy weather'
    expect { subject.land(plane) }.to raise_error message
  end
end
