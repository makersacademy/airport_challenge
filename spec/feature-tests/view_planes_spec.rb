require 'airport'
require 'plane'

describe 'Viewing the plane(s)' do
  airport = Airport.new
  plane = Plane.new
  it 'should be able to display landed planes' do
    n_planes = rand(10)
    expected_planes = Array.new(n_planes, plane)
    n_planes.times { airport.land plane }
    expect( airport.planes ).to eq expected_planes
  end
end
