require 'airport'
require 'plane'

describe Airport, :focus => true do

  it "should allow a plane to land" do
    expect(Airport.new(Weather.new).request_to_land(Plane.new)).to eq true
  end

  it 'should store the information about landed planes' do
    airport = Airport.new(Weather.new)
    airport.request_to_land(Plane.new)
    expect(airport.planes.count).to eq 1
  end

  it "should allow a plane to take off" do
    plane = Plane.new
    weather = double(:weather)
    allow(weather).to receive(:sunny?).and_return(true)
    airport = Airport.new(weather)
    plane.land(airport)
    expect(airport.request_take_off(plane)).to eq true
  end

  it 'should remove the information about a plane when it takes off' do
    plane = Plane.new
    weather = double(:weather)
    allow(weather).to receive(:sunny?).and_return(true)
    airport = Airport.new(weather)
    plane.land(airport)
    airport.request_take_off(plane)
    expect(airport.planes.count).to eq 0
  end

  it 'should remove planes after taking off' do
    plane_one = Plane.new
    plane_two = Plane.new
    weather = double(:weather)
    allow(weather).to receive(:sunny?).and_return(true)
    airport = Airport.new(weather)
    plane_one.land(airport)
    plane_two.land(airport)
    expect(airport.planes.count).to eq 2
    plane_one.take_off(airport)
    expect(airport.planes.count).to eq 1
  end

  it 'should prevent take off when it is stormy' do
    plane = Plane.new
    weather = double(:weather)
    allow(weather).to receive(:sunny?).and_return(false)
    airport = Airport.new(weather)
    plane.land(airport)
    expect(airport.request_take_off(plane)).to eq false
  end

end
