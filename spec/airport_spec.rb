require 'airport'
require 'plane'

describe Airport do
  it 'has a default capacity' do
    airport = Airport.new
    expect(airport.report_capacity).to eq 10
  end
  
  it 'can check if it is full' do
    airport = Airport.new
    expect { airport.full? }.to_not raise_error
  end

  it 'can check for stormy weather' do
    airport = Airport.new
    expect(airport.stormy?).to be(true).or be(false)
  end

  describe '#land' do
    it 'can have planes land at it' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.land(plane) }.to_not raise_error
    end

    it 'prevents planes landing when the airport is full' do
      airport = Airport.new
      plane = Plane.new
      10.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end

    it 'prevents planes from landing when weather is stormy' do
      airport = Airport.new
      plane = Plane.new
      airport.weather_update("Stormy")
      expect { airport.land(plane) }.to raise_error 'Cannot land during stormy weather'
    end
  end

  describe '#weather_update' do
    it 'can receive a weather update' do
      airport = Airport.new
      expect { airport.weather_update("Sunny") }.to_not raise_error
    end
  end

  describe '#take_off' do
    it 'can have planes take off' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.to_not raise_error
    end

    it 'removes the plane once it takes off' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.list_planes).to_not include(plane)
    end
  end
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy

=begin
|Objects|Messages|
Passenger
Plane land take_off
Airport full? error if attempt to land while full capacity

Tests - Weather? Sunny/Stormy
=end
