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

  it 'checks whether or not a plane is in the airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.check_plane_status(plane)).to eq "Plane in airport"
    airport.take_off(plane)
    expect(airport.check_plane_status(plane)).to eq "Plane not in airport"
  end

end
