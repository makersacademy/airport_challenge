require 'airport'
require 'plane'

RSpec.describe 'Feature Tests' do
  it 'instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.to_not raise_error
  end
end
