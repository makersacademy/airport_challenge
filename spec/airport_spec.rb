require 'airport'
require 'plane'

describe Airport do

  it 'Feature Test: lands plane then checks it is in the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to contain_exactly(plane)
  end

  it 'Feature test: plane takes off from airport and confirms plane no longer there' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off).to eq([])

  end
  
end
