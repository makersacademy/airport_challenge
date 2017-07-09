require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  plane = Plane.new

  it 'allows a plane to land' do
    expect(airport.land(plane)).to eq [plane]
  end


  it 'shows planes in airport' do
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  # it 'checks if a plane has landed' do
  #
  # end

end
