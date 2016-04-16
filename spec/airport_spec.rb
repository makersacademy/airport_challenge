require 'airport'

describe Airport do

  it 'adds a plane once it has landed' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end

  it 'removes a plane once it has taken off' do
    plane = Plane.new
    airport = Airport.new
    airport.take_off(plane)
    expect(airport.planes).not_to include(plane)
  end


end
