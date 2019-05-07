require 'airport'
require 'weather'
require 'plane'

describe Airport do
  
  subject(:airport) {Airport.new}
  describe '#Land Plane' do

    # Test that airport responds to land plane method
    it { is_expected.to respond_to :land_plane }

    # Test land plane method takes in argument
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    # Test adding landed plane to hangar array
    it 'Adds 1 plane to hangar' do
      plane = Plane.new
      airport.conditions = "sunny"
      expect(airport.land_plane(plane)).to eq [plane]
    end

    # Test error msg if plane tries to land when hangar is full
    it 'Full hangar returns error msg' do
      airport.capacity.times { airport.land_plane Plane.new }
      expect { subject.land_plane(Plane.new) }.to raise_error('Hangar is full')
    end

    # Test error msg if plane tries to land with stormy weather
    it 'Error msg raised when plane tries to land in stormy weather' do
      airport = Airport.new
      airport.conditions = "stormy"
      expect { airport.land_plane(Plane.new) }.to raise_error('Weather is too dangerous')
    end

  end

  describe '#Capacity' do
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
  end

  # Tests generate weather method
  it 'Test generate weather method' do
    expect(airport.conditions).to eq("stormy").or eq("sunny")
  end

  # Test airport responds to take_off method
  it { is_expected.to respond_to :take_off }

  # Test take_off method takes argument
  it { is_expected.to respond_to(:take_off).with(1).argument }

  # Test error msg if plane tries to land with stormy weather
  it 'Error msg raised when plane tries to take off in stormy weather' do
    plane = Plane.new
    airport.conditions = "stormy"
    expect { airport.take_off(plane) }.to raise_error('Weather is too dangerous')
  end

  # Test error msg if airport tries to take off a plane that does not exist in hangar
  it 'Error msg when take off plane that is not in hangar' do
    plane = Plane.new
    airport = Airport.new
    airport.conditions = "sunny"
    expect { airport.take_off(plane) }.to raise_error('That plane is not in the hangar')
  end

  # Test the take_off plane removes plane from hangar
  it 'Deletes plane from hangar successfully' do
    plane = Plane.new
    airport.conditions = "sunny"
    airport.land_plane(plane)
    airport.take_off(plane)
    expect(airport.hangar).to eq []
  end

end
