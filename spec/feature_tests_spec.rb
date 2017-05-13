require './lib/airport'
require './lib/plane'

airport = Airport.new
plane = Plane.new

describe 'Landing' do
  it'ATC instructs a plane to landed gets a confirmation' do
    expect(airport.land(plane)).to eq "Plane has landed"
  end
end
describe 'Taking Off' do
  it'ATC instructs a plane to landed gets a confirmation' do
    expect(airport.plane_takeoff).to eq "Plane has taken off"
  end
end
