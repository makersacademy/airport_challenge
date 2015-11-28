require 'plane'
require 'airport'

describe 'Feature: ' do

  storm_seed = (1..100).select{|n| srand(n); rand(20) == 0 }[0]
  sun_seed = storm_seed - 1
  let(:plane) { Plane.new }
  let(:empty_airport) { Airport.new }
  let(:airport_with_plane) { srand(sun_seed); Airport.new.land plane }

  it 'planes can land at airport when instructed' do
    airport = empty_airport
    srand(sun_seed)
    airport.land plane
    expect(airport.contain? plane).to eq true
  end

  it 'only planes can land at an airport' do
    airport = empty_airport
    expect{airport.land 'not a plane'}.to raise_error 'That is not a plane!'
  end

  it 'do not allow landing in stormy weather' do
    airport = empty_airport
    srand(storm_seed)
    expect{airport.land plane}.to raise_error "The weather is too stormy!"
  end

  it 'planes can take off from airport when instructed' do
    airport = airport_with_plane
    srand(sun_seed)
    airport.takeoff plane
    expect(airport.contain? plane).to eq false
  end

  it 'only planes which are at an airport can take off from it' do
    airport = airport_with_plane
    expect{airport.takeoff Plane.new}.to raise_error 'Plane not found!'
  end

  it 'do not allow takeoff in stormy weather' do
    airport = airport_with_plane
    srand(storm_seed)
    expect{airport.takeoff plane}.to raise_error "The weather is too stormy!"
  end
end
