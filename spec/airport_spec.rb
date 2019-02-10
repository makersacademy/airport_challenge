require './lib/airport.rb'

describe Airport do

  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(airport.planes).to include(plane)
  end

  it 'can allow a plane to takeoff' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    airport.takeoff_plane(plane)
    expect(airport.planes).to_not include(plane)
  end
end
