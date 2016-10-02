require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  it 'allows a plane to land' do
    airport.land_plane(plane)
    expect(airport.planes).to include plane 
  end
end