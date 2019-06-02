require 'airport'

describe Airport do
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

  it 'plane takes off' do
    plane = Plane.new
    airport = Airport.new
    airport.take_off(plane)
    expect(airport.planetoadd).not_to include(plane)
  end

  it 'prints a message' do
    airport = Airport.new
    expect {airport.take_off(@plane) }.to output("Plane has taken off \n").to_stdout
  end
end
