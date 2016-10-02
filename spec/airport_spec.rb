require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  it 'allows a plane to land and confirms it is in the airport' do
    airport.land_plane(plane)
    expect(airport.planes).to include plane 
  end

  it 'allows a plane to take off and confirms it is no longer in the airport' do
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end
end