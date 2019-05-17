require 'airport'
require 'plane'
require 'weather'

describe Airport do 

let(:airport) { Airport.new }
let(:plane) { Plane.new }
let(:weather) { Weather.new }

  it 'Instruct a plane to land at an airport' do
    airport.landing_plane(plane)
    expect(airport.airport_store.length).to eq(1)
  end

  it 'Instruct a plane to take off from an airport, and confirm take-off' do
    expect(airport.take_off(plane)).to eq("Plane has taken off from the airport")
  end

  it 'Prevent takeoff when weather is stormy' do
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq("Plane cannot take off as weather is too stormy")
  end

end