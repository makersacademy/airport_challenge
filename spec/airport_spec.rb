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
    expect(airport).to respond_to(:try_allow_landing).with(1).argument
  end

  it 'should allow a plane to take off at an airport' do
    expect(airport).to respond_to(:try_allow_take_off).with(1).argument
  end

  it 'should raise an exception when trying to land a plane at a full airport' do
    Airport::DEFAULT_CAPACITY.times { airport.try_allow_landing(Plane.new) }
    expect{airport.try_allow_landing(Plane.new)}.to raise_error 'No space available'
  end

end
