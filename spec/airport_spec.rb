require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it 'should have a default capacity of 10 when instantiated with no arguments' do
    expect(airport.capacity).to eq 10
  end

  it 'should allow user to specify a capacity when creating a new airport' do
    expect(airport(20).capacity).to eq 20
  end

end
