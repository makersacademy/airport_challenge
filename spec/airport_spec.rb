require 'airport'

describe Airport do
airport = Airport.new
  it 'reads land method' do
    expect(airport).to respond_to (:land)
  end

  it 'reads land argument' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'reads attr_reader' do
    expect(airport).to respond_to(:planes)
  end

  it 'plane takes off' do
    expect(airport).to respond_to(:take_off)
  end

  describe '#land' do
    DEFAULT_CAPACITY = 20
    DEFAULT_CAPACITY.times { airport.land(Plane.new) }
     it 'raises an error when airport is full' do
      expect {airport.land(Plane.new)}.to raise_error 'Airport is full'
     end
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
