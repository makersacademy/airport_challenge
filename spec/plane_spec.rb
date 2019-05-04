require 'plane'
require 'airport'

describe Plane do
  it 'land a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq('landed at airport')
  end
end
