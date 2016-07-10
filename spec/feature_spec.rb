require 'airport'

describe 'feature test' do

  it 'allows planes to move in and out of airports' do
    airport1 = Airport.new
    allow(airport1.weather).to receive(:stormy?) { false }
    plane1 = Plane.new
    plane2 = Plane.new
    airport1.land(plane1)
    airport1.land(plane2)
    airport2 = Airport.new 1
    allow(airport2.weather).to receive(:stormy?) { false }
    airport1.take_off(plane1)
    airport2.land(plane1)
    airport1.take_off(plane2)
  end

end
