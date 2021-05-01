require 'airport'

describe Airport do 
  it 'lands at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq([plane])
  end

  it 'stores planes in an airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to eq([plane])
  end

  it 'takes off' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)

    expect(airport.take_off(plane)).to eq(plane)
  end

  it 'removes itself from an airport after takin off' do
    airport = Airport.new
    plane = Plane.new
    plane2 = Plane.new

    airport.land(plane)
    airport.land(plane2)
    airport.take_off(plane)

    expect(airport.planes).not_to include([plane])
  end
end