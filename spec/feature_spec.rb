require 'plane'
require 'airport'

describe 'Feature: ' do

  let(:plane) { Plane.new }
  let(:empty_airport) { Airport.new }
  let(:airport_with_plane) { Airport.new.land plane }

  it 'planes can land at airport when instructed' do
    airport = empty_airport
    airport.land plane
    expect(airport.contain? plane).to eq true
  end

  it 'only planes can land at an airport' do
    airport = empty_airport
    expect{airport.land 'not a plane'}.to raise_error
  end

  it 'planes can take off from airport when instructed' do
    airport = airport_with_plane
    airport.takeoff plane
    expect(airport.contain? plane).to eq false
  end

  it 'only planes which are at an airport can take off from it' do
    airport = airport_with_plane
    expect{airport.takeoff Plane.new}.to raise_error
  end
end
