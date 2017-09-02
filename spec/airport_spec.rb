require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double:plane }

  describe '#land'
    it 'allows an airport to accept a landing plane' do
      expect(airport.land(plane)).to eq [plane]
    end
    it 'raises an error when the airport is full' do
      airport.capacity.times {  airport.land double(:plane) }
      expect { airport.land plane }.to raise_error 'Airport is full'
    end
    # it 'raises an error when the plane has already landed' do
    #   airport.land(plane)
    #   expect {airport.land(plane)}.to raise_error 'Plane has already landed'
    # end


  describe '#take_off'
    it 'allows a plane to take off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it 'raises an error if the plane does not exist' do
      expect { airport.take_off(plane) }.to raise_error 'Plane must land first before it can take off'
    end

  it 'has a default capacity for planes' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
