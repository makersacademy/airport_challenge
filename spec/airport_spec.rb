require 'airport'
require 'plane'

describe Airport do
  let(:serial_number) { 25_817 }
  let(:airport) { Airport.new("Heathrow") }
  let(:plane) { instance_double(Plane, :serial_number => serial_number) }
  
  before do
    allow(plane).to receive(:change_location).with(any_args)
  end

  it 'has a default capacity' do
    expect(airport.report_capacity).to eq Airport::DEFAULT_CAPACITY
  end
  
  it 'can check if it is full' do
    expect { airport.full? }.to_not raise_error
  end

  it 'can check for stormy weather' do
    expect(airport.stormy?).to be(true).or be(false)
  end

  describe '#land' do
    it 'can have planes land at it' do
      expect { airport.land(plane) }.to_not raise_error
    end

    it 'prevents planes landing when the airport is full' do
      expect { (Airport::DEFAULT_CAPACITY + 1).times { airport.land(plane) } }.to raise_error 'Airport is full'
    end

    it 'prevents planes from landing when weather is stormy' do
      airport.weather_update("Stormy")
      expect { airport.land(plane) }.to raise_error 'Cannot land during stormy weather'
    end
  end

  describe '#weather_update' do
    it 'can receive a weather update' do
      expect { airport.weather_update("Sunny") }.to_not raise_error
    end
  end

  describe '#take_off' do
    it 'can have planes take off' do
      airport.land(plane)
      expect { airport.take_off(serial_number) }.to_not raise_error
    end

    it 'removes the plane once it takes off' do
      # allow(plane).to receive(:change_location).with(any_args)
      airport.land(plane)
      airport.take_off(serial_number)
      expect(airport.list_planes).to_not include(plane)
    end

    it 'raises an error if attempting to take off a plane that is not at the airport' do
      expect { airport.take_off(serial_number) }.to raise_error 'Plane not found at this airport'
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
