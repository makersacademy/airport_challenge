require_relative '../lib/airport_challenge.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'allows planes to land in sunny weather' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.land(plane)).to eq [plane]
    end

    it 'does not allow planes to land in stormy weather' do
      # @weather == :stormy
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }. to raise_error 'Weather warning. Cannot land.'
    end

    it 'prevents planes from landing when airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Sorry we are full'
    end
  end

  describe '#take_off' do

    it 'allows planes to take off from airport' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq []
    end

    it 'prevents take off when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      # @weather == :stormy
      expect { airport.take_off(plane) }. to raise_error 'Weather warning. Cannot take-off.'
    end

    it 'keeps remaining planes at airport when plane leaves' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.land(plane2)
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane)).to eq [plane2]
    end

  end

end
