require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Airport do
  default_capacity = Airport::DEFAULT_CAPACITY
  airport = Airport.new

  def clear_weather_at(airport)
    allow(airport.weather).to receive(:chance) { 100 }
  end

  it 'prevents landing if at full capacity' do
    clear_weather_at(airport)
    default_capacity.times { Plane.new.land_at_airport(airport) }
    expect { Plane.new.land_at_airport(airport) }.to raise_error("Airport is full")
  end

  it 'allows to override default capacity' do
    clear_weather_at(airport)
    airport.capacity = default_capacity + 1
    expect(airport.capacity > default_capacity).to eq(true)
  end
end
