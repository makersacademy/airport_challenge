require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'instruct a plane to land at an airport' do
    airport.land(plane)
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'adding plane into the storage' do
    airport.land(plane)
    expect(airport.show_planes).to include(plane)
  end

  it 'instructs a plane to take off from an airport' do
    airport.take_off(plane)
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'removing plane from the storage' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq nil
  end

end
