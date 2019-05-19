require 'airport'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it 'expect airport to be a kind of Airport' do
    expect(airport).to be_a_kind_of(Airport)
  end

  it 'expect airport to respond to the land method' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'expects a plane to be able to land at the airport' do
    output = airport.land(plane)
    expect(airport.show_planes.length).to eq(1)
  end

  it 'expects airport to respond to plane_takeoff' do
    expect(airport).to respond_to(:plane_takeoff)
  end

  it 'expects a plane to be able to take off from the airport' do
    airport.land(plane)
    airport.plane_takeoff
    expect(airport.show_planes.length).to eq(0)
  end

  it 'expects airport to respond to weather' do
    expect(airport).to respond_to(:weather)
  end

  it 'expects a plane not to be able to land at the airport when the airport is full' do
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    expect(airport.land(plane)).to eq("There's no more space on the runway")
  end

  it 'accepts airport capacity at initialization' do
    airport = Airport.new(4)
    expect(airport.capacity).to eq(4)
  end

end
