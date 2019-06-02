require 'airport'

describe Airport do

  it 'plane takes off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end

  it 'plane lands' do
    plane = Plane.new
    expect(plane.land).to be_a Plane
  end

  it 'adds a plane to the airport' do
    plane = Plane.new
    airport = Airport.new
    airport.add(plane)
    expect(airport.planetoadd).to include(plane)
  end
end
