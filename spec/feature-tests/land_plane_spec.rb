require 'airport'
require 'plane'

describe 'Landing a plane' do
  airport = Airport.new
  plane = Plane.new
  it 'should be able to land a plane' do
    expect{ airport.land plane }.to_not raise_error
  end
  it 'should be able to display landed planes' do
    airport.land plane
    expect( airport.planes ).to eq [plane]
  end
end
