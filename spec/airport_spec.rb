require 'airport'
require 'plane'
require 'weather'

describe Airport do
  airport = Airport.new
  plane = Plane.new
  weather = Weather.new

  it 'Feature Test: lands plane then checks it is in the airport' do
    airport.land(plane)
    expect(airport.hanger).to contain_exactly(plane)
  end

  it 'Feature test: plane takes off from airport and confirms plane no longer there' do
    #weather.stormy? == false
    #weather = double(stormy?: false)
    #allow(weather).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(airport.take_off(plane)).to eq []
  end

  it 'Prevents planes landing when the airport is full' do
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error(RuntimeError, "Airport is already full of planes!")
  end

  it 'allows a user to set capacity when creating a new Airport instance' do
    airport = Airport.new(25)
    expect { airport @capacity == 25 }
  end

  it 'Prevents the plane from taking off if weather is stormy' do
    # airport.land(plane)
    #weather.stormy? == :stormy
    #allow(weather).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error(RuntimeError, "We can't take off, it's blowin a gale!")
  end


end
