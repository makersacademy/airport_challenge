require 'airport'
require 'plane'

describe Airport do
  # subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }


  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  it 'should have a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'land a plane at the airport' do
        expect(airport.land(plane)).to eq [plane]
      end

    context 'when full' do
      it 'it raises an error' do
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane)}.to raise_error "Airport is full"
        end
      end
    end
  end

  context 'when stormy' do
    it 'raises an error' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Cannot land, due to stormy weather'
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'allows a plane to take off and confirm plan has left' do
        airport.land(plane)
        expect(airport.take_off).to eq "#{plane} has taken off."
      end
    end

    context 'when stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off }.to raise_error 'Cannot take off, due to stormy weather'
      end
    end
  end
end
