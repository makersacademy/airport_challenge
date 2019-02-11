require './lib/plane.rb'

describe Plane do
  it 'can land at a stated airport' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    plane.land(airport)
    expect(airport.planes).to include(plane)
  end

  it 'can take off from a stated airport' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    plane.land(airport)
    allow(airport).to receive(:stormy?) { false }
    plane.takeoff(airport)
    expect(airport.planes).to_not include(plane)
    expect(plane.location).to eq 'flying'
    expect(plane.location).to_not eq airport.airport_name
  end

  it 'Does not allow a request to land if already landed' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    plane.land(airport)
    allow(airport).to receive(:stormy?) { false }
    expect { plane.land(airport) }.to raise_error("This plane has already landed")
  end

  it 'Does not allow a request to takeoff if already flying' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    expect { plane.takeoff(airport) }.to raise_error("This plane is already flying")
  end
end
