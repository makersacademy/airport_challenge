require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  describe '#land'
    it 'allows an airport to accept a landing plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end
    it 'raises an error when the airport is full' do
      airport.capacity.times {airport.land Plane.new}
      expect {airport.land Plane.new}.to raise_error 'Airport is full'
    end

  describe '#take_off'
    it 'allows a plane to take off' do
      plane = Plane.new
      expect(airport.take_off(plane)).to eq nil
    end

  it 'has a default capacity for planes' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
