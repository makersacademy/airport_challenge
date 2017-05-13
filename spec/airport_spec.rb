require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it 'should have a default capacity of 10 when instantiated with no arguments' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should allow user to specify a capacity when creating a new airport' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  it 'should allow user to override airport capacity' do
    expect(airport.capacity = 30).to eq 30
  end

  it 'should allow a plane to land at an airport' do
    expect(airport).to respond_to(:try_accept).with(1).argument
  end

end
