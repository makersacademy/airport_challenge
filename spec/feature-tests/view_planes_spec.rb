require 'airport'
require 'plane'

describe 'Viewing the plane(s)' do
  airport = Airport.new
  plane = Plane.new
  it 'should be able to display a landed plane' do
    airport.land plane
    expect( airport.planes ).to eq plane
  end
end
