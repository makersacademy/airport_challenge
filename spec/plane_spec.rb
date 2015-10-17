require 'airport'

describe Plane do
  it 'when a plane lands it notes the airport' do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)

    expect(my_plane.airport_location(my_airport)).to eq my_airport
  end

  it 'check plane has no airport id when flying' do
    my_airport = Airport.new
    my_plane = Plane.new

    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)

    expect(my_plane.flying).to be true
    expect(my_plane.airport).to be nil
  end

  it 'check plane that is not flying cannot land and must be in an airport' do
    my_airport = Airport.new
    my_plane = Plane.new

    my_airport.land(my_plane)

    expect{my_airport.land(my_plane)}.to raise_error 'already in airport'
  end

  it 'checks when a plane takes off it is removed from the airport list' do
    my_airport = Airport.new
    my_plane = Plane.new

    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)



  end

end
