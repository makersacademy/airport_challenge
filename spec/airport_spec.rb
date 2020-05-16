require_relative '../lib/airport'

describe Airport do
  subject(:airport) { Airport.new }

  it 'has a default capacity' do
    expect(airport).to respond_to(:capacity)
    expect(airport.capacity).to eq(100)
  end

  it 'is able to have planes' do
    expect(airport).to respond_to(:planes)
    expect(airport.planes).to be_an_instance_of(Array)
  end

  it 'can be at capacity' do
    expect(airport.at_capacity?).to be(true).or be(false)
  end

end
