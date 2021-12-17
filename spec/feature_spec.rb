require 'airport'
require 'plane'

describe 'airport challenge' do
  it 'lands a plane at an airport' do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane)
  end
  it 'takes off a plane and confirms it is no longer in the airport' do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane)
    airport.takeoff(plane)

    expect(airport.landed?(plane)).to eq false
  end
  it 'prevents landing when airport is full' do
    airport = Airport.new

    airport.capacity.times { airport.land(Plane.new) }

    expect { airport.land(Plane.new) }.to raise_error('Airport full')
  end
  it 'allows default airport capacity to be overridden' do
    airport_default = Airport.new
    bigger_capacity = airport_default.capacity + 10
    
    airport = Airport.new(bigger_capacity)
    bigger_capacity.times { airport.land(Plane.new) }

    expect { airport.land(Plane.new) }.to raise_error('Airport full')
  end
end
