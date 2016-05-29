require 'airport'

describe 'feature test' do

  it 'allows planes to land and take off' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    airport = Airport.new(3)
    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    airport.take_off(plane1)
    plane1.flying?
    plane2.landed?
  end
  
end