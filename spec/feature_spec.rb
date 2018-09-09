require 'plane'
require 'airport'
require 'weather'

DEFAULT_CAPACITY = 10

describe 'Features' do
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
  describe 'instruct plane to land' do
    before(:each) do
      @airport = Airport.new
      @plane = Plane.new
    end
    it 'lands plane at the airport' do
      @airport.land(@plane)
      expect(@airport.contains?(@plane)).to be(true)
    end
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  describe 'instruct plane to take off' do
    before(:each) do
      @airport = Airport.new
      @plane = Plane.new
    end
    it 'takes off without error' do
      @airport.land(@plane)
      expect(@airport.take_off(@plane)).to eq(@plane)
    end
    it 'can no longer be found at airport' do
      @airport.land(@plane)
      @airport.take_off(@plane)
      expect(@airport.contains?(@plane)).to be(false)
    end
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
  describe 'prevent landing when airport is full' do
    before(:each) do
      @airport = Airport.new
      @plane = Plane.new
    end
    it 'raises error when plane tries to land at a full airport' do
      DEFAULT_CAPACITY.times { @airport.land(Plane.new) }
      expect { @airport.land(@plane) }.to raise_error('Airport full')
    end
  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
  describe 'set capacity of airport' do
    it 'initialises default capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq(DEFAULT_CAPACITY)
    end
    it 'allows system designer to override default capacity' do
      test_capacity = 25
      airport = Airport.new(test_capacity)
      expect(airport.capacity).to eq(test_capacity)
    end
  end

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
  describe 'prevents planes from landing during stormy weather' do
    it 'raises error when plane tries to land during stormy weather' do
      weather = Weather.new
      airport = Airport.new
      plane = Plane.new
      airport.weather = weather
      weather.stormy!
      expect { airport.land(plane) }.to raise_error('Cannot land because of stormy weather')
    end
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
  describe 'prevents planes from taking off during stormy weather' do
    it 'raises error when plane tries to take off during stormy weather' do
      weather = Weather.new
      airport = Airport.new
      plane = Plane.new
      airport.weather = weather
      weather.stormy!
      expect { airport.take_off(plane) }.to raise_error('Cannot take off because of stormy weather')
    end
  end

end
