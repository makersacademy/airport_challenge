require 'airport'
require 'plane'

RSpec.describe 'Feature Tests' do
  it 'instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.to_not raise_error
  end

  it 'instruct a plane to take off and check it left' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)

    expect(airport.plane).to_not eq plane
  end
end
