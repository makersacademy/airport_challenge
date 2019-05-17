require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it 'changes from flying to not flying when it lands' do
    airport.land_plane(plane)
    expect(plane.flying).to eq(false)
  end

  it 'changes from not flying to flying when it takes off' do
    airport.land_plane(plane)
    airport.takeoff
    expect(plane.flying).to eq(true)
  end



end
