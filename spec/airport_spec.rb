require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it 'Feature Test: lands plane then checks it is in the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.hanger).to contain_exactly(plane)
  end

  it 'Feature test: plane takes off from airport and confirms plane no longer there' do
    airport = Airport.new
    plane = Plane.new
    weather = Weather.new
    airport.land(plane)
    weather.sunny
    expect(airport.take_off(plane)).to eq []
  end

  it 'Prevents the plane from taking off in stormy weather' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    weather = double(sunny: false)
    #p "weather.stormy is: #{weather.stormy}"
    expect { airport.take_off(plane) }.to raise_error(RuntimeError, "weather is stormy, can't take off")
  end

  it 'Prevents planes landing when the airport is full' do
    plane = Plane.new
    airport = Airport.new
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error(RuntimeError, "airport is full")
  end

end
