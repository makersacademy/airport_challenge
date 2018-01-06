require 'airport'
require 'plane'

describe 'Taking off' do
  airport = Airport.new
  plane = Plane.new
  it 'a plane should be able to take off' do
    airport.land plane
    expect { airport.take_off }.to_not raise_error
  end
end
