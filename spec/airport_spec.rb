require './lib/airport'

describe Airport do

  it 'can creates an airport' do
    expect(Airport.new).to be_a Airport
  end

  it 'can land a plane' do
    expect(Airport.new).to respond_to(:land).with(1).argument
  end

  it 'can take off a plane' do
    expect(Airport.new).to respond_to(:take_off).with(1).argument
  end

  it 'saves the landed plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end

  it 'decreases the planes that take off' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq 0
  end

  it 'confirms plane taken off' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane) }.to raise_error('Plane has already taken off')
    end
end
