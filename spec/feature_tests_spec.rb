require './lib/airport'
require './lib/plane'

airport = Airport.new
plane = Plane.new

describe 'Landing' do
  it'ATC instructs a plane to landed gets a confirmation' do
    expect(airport.land(plane)).to eq "Plane has landed"
  end
end
