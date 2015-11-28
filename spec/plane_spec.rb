require 'plane'
require 'airport'


describe Plane do

  it 'should land into airport' do
    plane = Plane.new
    airport = Airport.new
    plane.land_at(airport)
    expect(airport.planes.last).to eq plane
  end

  it 'should confirm landing' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land_at(airport)).to eq "Plane #{plane.object_id} landed!"
  end

  it 'should take off and leave the airport' do
    plane = Plane.new
    airport = Airport.new
    plane.take_off_from(airport)
    expect(airport.planes).to be_empty
  end

  it 'should confirm plane is no longer at the airport' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.take_off_from(airport)).to eq "Plane #{plane.object_id} just took off!"
  end


end
