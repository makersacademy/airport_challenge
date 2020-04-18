require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Plane do
  weather_no_storm = Weather.new(0)
  airport = Airport.new(weather_no_storm)
  plane = Plane.new

  it 'lands at airport' do
    plane.land_at_airport(airport)
    expect(airport.planes[0]).to eq(plane)
  end

  it 'leaves airport' do
    plane.leave_airport(airport)
    expect(airport.planes.empty?).to eq(true)
  end
end
