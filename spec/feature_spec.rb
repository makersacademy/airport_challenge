require 'plane'
require 'airport'

describe 'Feature: ' do

  let(:plane) { Plane.new }
  let(:empty_airport) { Airport.new }
  let(:airport_with_plane) { Airport.new.land plane }

  it 'can land plane at airport' do
    airport = airport_with_plane
    expect(airport.planes.include? plane).to eq true
  end

  it 'can confirm airport contains plane' do
    airport = airport_with_plane
    expect(airport.contain? plane).to eq true
  end

  it 'can confirm airport doesnt contain plane' do
    airport = empty_airport
    expect(airport.contain? plane).to eq false
  end

end
