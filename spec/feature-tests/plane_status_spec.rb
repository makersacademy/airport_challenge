require 'airport'
require 'plane'

describe 'Plane status' do
  plane = Plane.new
  airport = Airport.new
  it 'checks if a plane is flying' do
    expect(plane.landed?).to be false
  end
  it 'checks if a plane has landed' do
    airport.land(plane)
    expect(plane.landed?).to be true
  end
end
