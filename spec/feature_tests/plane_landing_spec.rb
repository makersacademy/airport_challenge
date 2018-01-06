require 'airport'

describe Airport do

  it 'should let a single plane land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'should let multiple planes land' do
    #initialise airport and two planes
    airport = Airport.new
    plane = Plane.new
    plane2 = Plane.new

    # land two planes in airport
    airport.land(plane)
    airport.land(plane2)
    expect(airport.planes).to eq [plane, plane2]
  end

end
