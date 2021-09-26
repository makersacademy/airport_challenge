require 'airport'
require 'plane'

describe Airport do 
  it 'expects a plane to land at an aiport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)). to eq plane
  end 
end