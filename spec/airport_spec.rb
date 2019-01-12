require 'airport'

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

describe Airport do
  it 'can instruct a plane to land i.e. responds to land method' do
    expect(subject).to respond_to(:land)
  end

  it 'can store the landed instance of a plane in the airport for counting' do
    instance_of_plane = Plane.new
    subject.land(instance_of_plane)
    expect(subject.planes_in_airport).to include(instance_of_plane)
  end

  it 'can instruct a plane to take off, i.e. responds to takeoff method' do
    expect(subject).to respond_to(:take_off)
  end

  it 'can remove the taken-off instance of a plane from the airport after takeoff' do
    instance_of_plane = Plane.new
    subject.land(instance_of_plane)
    subject.take_off(instance_of_plane)
    expect(subject.planes_in_airport).not_to include(instance_of_plane)
  end

  it 'checks that a plane cannot land twice in the same airport if already landed' do
    instance_of_plane = Plane.new
    subject.land(instance_of_plane)
    expect { subject.land(instance_of_plane) }.to raise_error('Plane already landed!')
  end

  it 'checks that a plane that has taken off cannot take off again from the same airport' do
    instance_of_plane = Plane.new
    expect { subject.take_off(instance_of_plane) }.to raise_error('Plane not in airport!')
  end

  it 'responds to a method checking if an airport is full' do
    expect(subject).to respond_to(:full?)
  end

  it 'can check check whether a defined airport instance is full and can no longer accept planes' do
    airport = described_class.new
    airport.capacity.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error('Airport is full!')
  end

end
