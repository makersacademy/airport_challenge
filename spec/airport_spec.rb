require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it 'creates a new instance of the Airport class' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end

  it 'calls planes to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.plane_list.length).to eq 1

  end

  it 'tells planes to take off' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    airport.take_off
    expect(airport.plane_list.length).to eq 0
  end
  
  it 'checks if plane has left the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.take_off).to eq "Flight has departed."
  end

  it 'can check if weather is sunny or stormy' do
    airport = Airport.new
    expect(airport.weather).to eq("Sunny").or eq("Stormy")
  end

  it 'can check that the weather checker is random' do
    airport = Airport.new
    expect(Nums).to receive(:rand)
    airport.weather
  end
end