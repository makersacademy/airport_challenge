require './lib/airport.rb'

describe Airport do

  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    airport.land_plane(plane)
    expect(airport.planes).to include(plane)
  end

  it 'can allow a plane to takeoff' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    airport.land_plane(plane)
    allow(airport).to receive(:stormy?) { false }
    airport.takeoff_plane(plane)
    expect(airport.planes).to_not include(plane)
  end

  it 'Will not allow a plane to takeoff if it is stormy' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    airport.land_plane(plane)
    allow(airport).to receive(:stormy?) { true }
    expect { airport.takeoff_plane(plane) }.to raise_error("We can't take off as it is stormy")
  end

  it 'Will not allow a plane to land if it is stormy' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { true }
    expect { airport.land_plane(plane) }.to raise_error("We can't land as it is stormy")
  end
end
