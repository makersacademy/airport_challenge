require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Weather do
  airport = Airport.new
  plane = Plane.new
  airport.planes << plane

  def storm_at(airport)
    allow(airport.weather).to receive(:chance) { 0 }
  end

  it 'prevents takeoff if stormy' do
    storm_at(airport)
    expect { plane.leave_airport(airport) }.to raise_error("Weather is stormy")
  end

  it 'prevents landing if stormy' do
    storm_at(airport)
    expect { plane.land_at_airport(airport) }.to raise_error("Weather is stormy")
  end
end
