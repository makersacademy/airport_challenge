require_relative '../docs/airport'
require_relative '../docs/plane'

describe Airport do
let(:airport) { Airport.new }

  it 'Airport has a default capacity of 5 planes' do
    expect(airport.capacity).to eq(5)
  end

  it 'Airport has empty parking station' do
    expect(airport.parking_station).to eql([])
  end

  it '.land adds plane to airport parking_station' do
    plane = Plane.new
    airport.land(plane)
    expect(airport.parking_station).to include(plane)
    expect(airport.parking_station.length).to eq(1)
  end

  it 'responds to .take_off' do
    expect(airport).to respond_to(:take_off)
  end
end
