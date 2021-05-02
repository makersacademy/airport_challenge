require 'airport'
require 'planes'

describe Airport do
  it 'instantiates with a default capacity value of 4' do
    default_airport = Airport.new
    expect(default_airport.capacity).to eq 4
  end

  it 'can be instantiated with an overriden capacity value' do
    sixer_airport = Airport.new(6)
    expect(sixer_airport.capacity).to eq 6
  end

  it 'knows it starts with 0 planes on the ground' do
    expect(subject.plane_count).to eq 0
  end

  it 'increases planes_in_port by 1 when a plane arrives' do
    plane1 = Plane.new
    airport = Airport.new
    airport.plane_arrives(plane1)
    expect(airport.plane_count).to eq 1
  end

  it 'decreases planes_in_port by 1 when a plane departs' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    airport.plane_arrives(plane1)
    airport.plane_arrives(plane2)
    # p airport.planes_in_port
    airport.plane_departs
    # p airport.planes_in_port
    expect(airport.plane_count).to eq 1
  end
end
