require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Plane do
  airport = Airport.new
  plane = Plane.new

  def clear_weather_at(airport)
    allow(airport.weather).to receive(:chance) { 100 }
  end

  it 'lands at airport' do
    clear_weather_at(airport)
    plane.land_at_airport(airport)
    expect(airport.planes[0]).to eq(plane)
  end

  it 'leaves airport' do
    clear_weather_at(airport)
    plane.leave_airport(airport)
    expect(airport.planes.empty?).to eq(true)
  end
end
