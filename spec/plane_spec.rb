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

  it 'raise error if plane is not docked before takeoff' do
    clear_weather_at(airport)
    expect { plane.leave_airport(airport) }.to raise_error("Plane not docked!")
  end

  it 'raise error is plane is already docked before landing' do
    clear_weather_at(airport)
    airport.planes << plane
    expect { plane.land_at_airport(airport) }.to raise_error("Plane is already docked!")
  end
end
