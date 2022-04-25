require 'plane'

describe Plane do 
  it 'creates an instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end 

  it 'can respond to land' do
    plane = Plane.new
    expect(plane).to respond_to(:land).with(1).argument
  end

  it 'can land a plane in an airport' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq(airport.planes)
  end

  it 'can raise an error if land method called on landed plane' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect { plane.land(airport) }.to raise_error 'Plane has already landed'
  end 

  it 'can raise an error if takeoff called on airport not containing plane' do
    plane = Plane.new
    airport1 = Airport.new
    airport2 = Airport.new 
    plane.land(airport1)
    expect { plane.takeoff(airport2) }.to raise_error 'Plane not in airport'
  end 

  it 'can raise an error if takeoff called on plane already in the air' do
    plane = Plane.new
    airport = Airport.new 
    expect { plane.takeoff(airport) }.to raise_error 'Plane already airbourne'
  end 

  it 'can respond to takeoff' do
    plane = Plane.new
    expect(plane).to respond_to(:takeoff).with(1).argument
  end

  it 'can takeoff from an airport' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    plane.takeoff(airport)
    expect(airport.planes).to eq([])
  end

  it 'raises an error when planes attempt to land in full airport' do
    airport = Airport.new
    airport.capacity.times { Plane.new.land(airport) }
    expect { Plane.new.land(airport) }.to raise_error 'Cannot land, airport is at capacity'
  end 

  it 'is prevented from landing if the weather is stormy' do
    plane = Plane.new
    airport = Airport.new 
    allow(@weather).to receive(:dice) { 6 }
    expect { plane.land(airport) }.to raise_error 'Cannot land in stormy weather'
  end 
end 
