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
    my_airport = Airport.new
    plane = Plane.new
    my_airport.land(plane)
    expect(my_airport.airport.length).to eq 1
  end

  it 'decreases the planes that take off' do
    my_airport = Airport.new
    plane = Plane.new
    my_airport.land(plane)
    my_airport.take_off(plane)
    expect(my_airport.airport.length).to eq 0
  end

  it 'confirms plane taken off' do
    my_airport = Airport.new
    plane = Plane.new
    my_airport.land(plane)
    my_airport.take_off(plane)
    expect { my_airport.take_off(plane) }.to raise_error('Plane has already taken off')
    end
end
