require 'airport'
require 'plane'

RSpec.describe 'Feature Test' do
  it 'instruct a plane to takeoff check it\'s no longer in the airport' do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane)
    airport.takeoff

    expect(airport.plane).to eq nil

  end
end
