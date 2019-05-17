require_relative '../docs/airport'
require_relative '../docs/plane'

# Key: => is what I expect the outcome to be for that line of code.

describe Airport do
let(:airport) { Airport.new }
let(:plane) { Plane.new }

  it 'Airport has a default capacity of 5 planes' do
    expect(airport.capacity).to eq(5)
  end

  it 'Airport has empty parking station' do
    expect(airport.parking_station).to eql([])
  end

  it '.land adds plane to airport parking_station' do
    airport.land(plane) # => 1
    expect(airport.parking_station).to include(plane)
    expect(airport.parking_station.length).to eq(1)
  end

  it 'responds to .take_off' do
    expect(airport).to respond_to(:take_off)
  end

  it '.take_off removes a plane from airport parking station' do
    airport.parking_station.push(plane) # => 1
    airport.take_off
    expect(airport.parking_station).not_to include(plane)
    expect(airport.parking_station.length).to eq(0)
  end

  it 'raise error for landing if airport is full' do
    5.times {
      plane = Plane.new
      airport.parking_station.push(plane)
    } # => 5
    expect{airport.land(plane)}.to raise_error "Unable to land, this airport is full"
  end

  it 'raise error for take_off if airport has no planes available' do
    expect{airport.take_off}.to raise_error "No planes available for take off"
  end

  it 'responds to .full?' do
    expect(airport).to respond_to(:full?)
  end
end
