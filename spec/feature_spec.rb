require 'airport'
require 'plane'
require 'weather'

describe 'simulating planes flow to and from same airport' do
  it 'allows more planes to land and take off from the airport' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    airport = Airport.new
    allow(airport).to receive(:stormy_weather?).and_return(false)
    airport.land(plane1)
    airport.land(plane2)
    airport.take_off(plane1)
  end
end

describe 'simulating planes flow to and from different airports' do
  it 'allows more planes to land and take off from the airport' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    allow(airport).to receive(:stormy_weather?).and_return(false)
    airport.land(plane1)
    airport.take_off(plane1)
    airport2 = Airport.new
    allow(airport2).to receive(:stormy_weather?).and_return(false)
    airport2.land(plane1)
  end
end
