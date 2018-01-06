require 'airport'
require 'plane'

describe 'Taking off' do
  airport = Airport.new
  plane = Plane.new
  it 'a plane should be able to take off' do
    airport.land plane
    airport.take_off
    expect(airport.planes).to be_empty
  end
  it 'a plane should be able to take off' do
    2.times { airport.land plane }
    2.times { airport.take_off }
    expect(airport.planes).to be_empty
  end
end
