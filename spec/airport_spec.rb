require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'exists as a class' do
    expect(described_class).to eq(Airport)
  end

  it 'has no planes when created' do
    expect(airport.landed_planes).to be_empty
  end

  it 'knows when a plane has landed' do    
    airport.land(plane)
    expect(airport.landed_planes).to include(plane)
  end
end
