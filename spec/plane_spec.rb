require 'plane'

describe Plane do 
  it 'creates an instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end 

  it 'can respond to land' do
    plane = Plane.new
    expect(plane).to respond_to(:land).with(1).argument
  end

   it 'can land a plane in an airport' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq(airport.planes)
  end
end 