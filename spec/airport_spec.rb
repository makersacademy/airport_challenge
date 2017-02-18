require 'airport'
require 'plane'

describe Airport do

  it "should allow a plane to land" do
    expect(Airport.new.request_to_land(Plane.new)).to eq true
  end

  it 'should store the information about landed planes' do
    airport = Airport.new
    airport.request_to_land(Plane.new)
    expect(airport.planes.count).to eq 1
  end

  it "should allow a plane to take off" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.request_take_off(plane)).to eq true
  end

  it 'should remove the information about a plane when it takes off' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    airport.request_take_off(plane)
    expect(airport.planes.count).to eq 0
  end

  it 'should remove planes after taking off' do
    plane_one = Plane.new
    plane_two = Plane.new
    airport = Airport.new
    plane_one.land(airport)
    plane_two.land(airport)
    expect(airport.planes.count).to eq 2
    plane_one.take_off(airport)
    expect(airport.planes.count).to eq 1
  end

end
