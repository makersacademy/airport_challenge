require './lib/plane.rb'

describe Plane do
  it 'can land at a stated airport' do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    plane.land(airport)
    expect(airport.planes).to include(plane)
  end

  it 'can take off from a stated airport' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    allow(airport).to receive(:stormy?) { false }
    plane.takeoff(airport)
    expect(airport.planes).to_not include(plane)
    expect(plane.location).to eq 'flying'
    expect(plane.location).to_not eq airport
  end
end
