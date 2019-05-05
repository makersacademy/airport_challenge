require 'plane'
require 'airport'

describe Plane do
  it 'land a plane' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.location).to eq(airport)
  end

  it 'takeoff a plane' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.takeoff).to eq('sky')
  end

end
