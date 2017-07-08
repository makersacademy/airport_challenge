require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it 'allows plane to land' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end
  
end
