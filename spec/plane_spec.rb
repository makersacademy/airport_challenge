require 'plane'
require 'airport'

describe Plane do 

  it 'changes LANDED status if it has taken off' do 
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    allow(airport).to receive(:stormy?) { false }
    airport.take_off(plane)
    expect(plane.landed).to eq false 
  end 

  it 'changes LANDED status if it has landed' do 
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    allow(airport).to receive(:stormy?) { false }
    airport.take_off(plane)
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(plane.landed).to eq true 
  end 

end
