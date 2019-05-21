require_relative '../docs/airport'
require_relative '../docs/plane'

# Key: => is what I expect the outcome to be for that line of code.

describe Airport do
let(:plane) { double(:plane, :report_in_flight => true, :flying? => true) }
let(:weather_not_safe) { double(:weather, :not_safe? => true) }
let(:airport) { Airport.new(5, weather_not_safe) }
let(:weather_safe) { double(:weather, :not_safe? => false) }
let(:airport_safe) { Airport.new(5, weather_safe) }

  it 'Airport has a default capacity of 5 planes' do
    expect(airport.capacity).to eq(5)
  end

  it 'Airport has empty parking station' do
    expect(airport.parking_station).to eql([])
  end

  it '.land adds plane to airport parking_station' do
    airport_safe.land(plane)
    expect(airport_safe.parking_station).to include(plane)
  end

  it '.take_off removes a plane from airport parking station' do
    airport_safe.parking_station.push(plane)
    airport_safe.take_off
    expect(airport_safe.parking_station).not_to include(plane)
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

  it '.take_off set plane to flying' do
    airport_safe.parking_station.push(plane)
    airport_safe.take_off
    expect(plane.flying?).to eq(true)
  end

  it '.take_off does not happen when weather is stormy' do
    airport.parking_station.push(plane)
    expect{airport.take_off}.to raise_error "Cannot take off in a storm"
  end

  it '.take_off does happen when weather is sunny' do
    airport_safe.parking_station.push(plane)
    expect{airport_safe.take_off}.not_to raise_error
  end

  it '.land does not happen when weather is stormy' do
    expect{airport.land(plane)}.to raise_error "Cannot land in a storm"
  end

  it '.land does happen when weather is sunny' do
    expect{airport_safe.land(plane)}.not_to raise_error
  end
end
