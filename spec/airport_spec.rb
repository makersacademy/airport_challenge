require_relative '../docs/airport'

describe Airport do
let(:airport) { Airport.new }

  it 'creates a new instance of airport' do
    expect(airport).to be_an_instance_of(Airport)
  end

  it 'Airport has a default capacity of 5 planes' do
    expect(airport.capacity).to eq(5)
  end
end
