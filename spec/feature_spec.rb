require 'airport'
require 'plane'

describe 'airport challenge' do
  before :each do
    srand(2)
  end
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
    allow(airport).to receive(:weather).and_return('sunny')

    airport.capacity.times { airport.land(Plane.new) }

    expect { airport.land(Plane.new) }.to raise_error('Airport full')
  end
  it 'allows default airport capacity to be overridden' do
    airport_default = Airport.new
    bigger_capacity = airport_default.capacity + 10
    
    airport = Airport.new(bigger_capacity)
    allow(airport).to receive(:weather).and_return('sunny')
    bigger_capacity.times { airport.land(Plane.new) }

    expect { airport.land(Plane.new) }.to raise_error('Airport full')
  end
  it 'prevents landing when weather is stormy' do
    airport = Airport.new
    plane = Plane.new

    allow(airport).to receive(:weather).and_return('stormy')
    expect { airport.land(plane) }.to raise_error('Weather is stormy')
  end
  it 'prevents takeoff when weather is stormy' do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane)
    allow(airport).to receive(:weather).and_return('stormy')
    expect { airport.takeoff(plane) }.to raise_error('Weather is stormy')
  end
  it 'prevents a plane landing at two airports' do
    airport_one = Airport.new
    airport_two = Airport.new
    plane = Plane.new

    allow(airport_one).to receive(:weather).and_return('sunny')
    allow(airport_two).to receive(:weather).and_return('sunny')

    airport_one.land(plane)
    expect { airport_two.land(plane) }.to raise_error('Plane is not airborne')
  end
end
