require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Airport do
  weather_no_storm = Weather.new(0)
  default_capacity = Airport::DEFAULT_CAPACITY
  airport = Airport.new(weather_no_storm)

  it 'prevents landing if at full capacity' do
    default_capacity.times { Plane.new.land_at_airport(airport) }
    expect { Plane.new.land_at_airport(airport) }.to raise_error("Airport is full")
  end

  it 'allows to override default capacity' do
    airport.capacity = default_capacity + 1
    expect(airport.capacity > default_capacity).to eq(true)
  end
end
