require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'exists as a class' do
    expect(described_class).to eq(Airport)
  end

  it 'knows when a plane has landed' do    
    plane.land_at(airport)
    expect(airport.landed_planes).to include(plane)
  end
end
