require 'airport'

describe Airport do
  it 'expect airport to be a kind of Airport' do
    airport = Airport.new
    expect(airport).to be_a_kind_of(Airport)
  end
  it 'expect airport to respond to the land method' do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end
  it 'expect airport to respond to show_planes' do
    airport = Airport.new
    expect(airport).to respond_to(:show_planes)
  end
  it 'expects a plane to be able to land at the airport' do
    airport = Airport.new
    plane = Plane.new
    output = airport.land(plane)
    expect(airport.show_planes.length).to eq(1)
  end
  it 'expects airport to respond to plane_takeoff' do
    airport = Airport.new
    expect(airport).to respond_to(:plane_takeoff)
  end
  it 'expects a plane to be able to take off from the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.plane_takeoff
    expect(airport.show_planes.length).to eq(0)
  end
end
