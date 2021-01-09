require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  #Let(:plane) { double :plane }
  plane = Plane.new

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  it 'should have a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'should let a plane land at the airport' do
      expect(airport.land(plane)).to eq [plane]
    end
    context 'when full' do
      it 'it raises an error' do
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane)}.to raise_error "Airport is full"
      end
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off and confirm plan has left' do
      airport.land(plane)
      expect(airport.take_off).to eq "#{plane} has taken off."
    end
  end
end
