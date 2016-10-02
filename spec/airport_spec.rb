require 'airport'

describe Airport do
airport = Airport.new

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:planes) }

  it { is_expected.to respond_to(:take_off) }

  it 'raises an error when there are no planes available for take off' do
    message = 'No planes available for take off'
      expect {airport.take_off}.to raise_error message
  end

  it 'raises an error when airport is full' do
    DEFAULT_CAPACITY = 20
    DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    message = 'Airport is full'
      expect {airport.land(Plane.new)}.to raise_error message
  end

  it 'gives default capacity' do
    expect(airport.capacity).to eq DEFAULT_CAPACITY
  end
end


describe 'user-given capacity' do
  airport = Airport.new(34)
    it 'overrides default capacity' do
      expect(airport.capacity).to eq 34
    end
end
