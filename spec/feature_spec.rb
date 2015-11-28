require 'plane'
require 'airport'

describe 'Feature: ' do

  let(:plane) { Plane.new }
  let(:airport_with_plane) { Airport.new.land plane }

  it 'can land plane at airport' do
    airport = airport_with_plane
    expect(airport.planes.include? plane).to eq true
  end

  it 'can confirm whether airport contains plane' do
    airport = airport_with_plane
    expect(airport.contain? plane).to eq true
  end

end
