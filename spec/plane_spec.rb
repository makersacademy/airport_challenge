require 'airport'

describe Plane do
  let (:stormy) { double :stormy}
  it 'when a plane lands it notes the airport' do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:stormy).and_return(false)
    my_airport.land(my_plane)

    expect(my_plane.airport_location(my_airport)).to eq my_airport
  end

  it 'check plane has no airport id when flying' do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:stormy).and_return(false)
    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)

    expect(my_plane.flying).to be true
    expect(my_plane.airport).to be nil
  end

  it 'check plane that is not flying cannot land and must be in an airport' do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:stormy).and_return(false)
    my_airport.land(my_plane)

    expect{my_airport.land(my_plane)}.to raise_error 'already in airport'
  end





end
