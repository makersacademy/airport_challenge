require 'plane'
require 'airport'


describe Plane do

  it 'should land plane into airport' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.planes.last).to eq plane
  end

  it 'should confirm landing' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq "Plane landed!"
  end

end
