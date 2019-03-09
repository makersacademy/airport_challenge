require 'airport'

describe Airport do

  # Test that airport responds to land plane method
  it { is_expected.to respond_to :land_plane }

  # Test land plane method takes in argument
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  # Test adding landed plane to hangar array
  it 'Adds 1 plane to hangar' do
    plane = Plane.new
    airport = Airport.new
    airport.conditions = "sunny"
    expect(airport.land_plane(plane)).to eq [plane]
  end

  # Test error msg if plane tries to land with stormy weather
  it 'Error msg raised when plane tries to land in stormy weather' do
    plane = Plane.new
    airport = Airport.new
    airport.conditions = "stormy"
    expect { airport.land_plane(plane) }.to raise_error('Weather is too dangerous')
  end


  # Test new airport object has default capacity
  it 'New airport object has default capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq 10
  end

  # Test that capacity can be overriden by system admin
  it 'create new airport with overriden capacity' do
    airport = Airport.new(100)
    expect(airport.capacity).to eq 100
  end

  # Test error msg if plane tries to land when hangar is full
  it 'Full hangar returns error msg' do
    subject.capacity.times { subject.land_plane Plane.new }
    expect { subject.land_plane(Plane.new) }.to raise_error('Hangar is full')
  end


  # Test airport responds to take_off method
  it { is_expected.to respond_to :take_off }

  # Test take_off method takes argument
  it { is_expected.to respond_to(:take_off).with(1).argument }

  # Test error msg if plane tries to land with stormy weather
  it 'Error msg raised when plane tries to take off in stormy weather' do
    plane = Plane.new
    airport = Airport.new
    airport.conditions = "stormy"
    expect { airport.take_off(plane) }.to raise_error('Weather is too dangerous')
  end

end
