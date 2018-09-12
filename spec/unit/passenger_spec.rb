require 'passenger'

describe Passenger do
  subject(:passenger) { described_class.new }

  context '#ticket?' do
    it 'returns true if has ticket' do
      expect(passenger.ticket?).to eq true
    end

    it 'returns false if has no ticket' do
      allow(passenger).to receive(:ticket?) { false }
      expect(passenger.ticket?).to eq false
    end
  end

  context '#on_plane?' do
    it 'returns true if on board' do
      passenger.boarded

      expect(passenger.on_plane?).to be true
    end

    it 'returns false if not on board' do
      passenger.leave

      expect(passenger.on_plane?).to be false
    end
  end

  context '#drop_luggage' do
    it 'returns true if dropped' do
      passenger.drop_luggage

      expect(passenger.luggage_dropped?).to eq true
    end

    it 'outputs that luggage has been dropped' do
      expect(passenger.drop_luggage).to eq('Luggage dropped!')
    end

    it 'raises error if already dropped' do
      passenger.drop_luggage

      expect { passenger.drop_luggage }.to raise_error('Luggage already dropped!')
    end

    it 'raises error if no ticket' do
      passenger = Passenger.new(false)

      expect { passenger.drop_luggage }.to raise_error('Passenger does not have ticket!')
    end
  end

  context '#collect_luggage' do
    before(:each) do
      passenger.drop_luggage
    end

    it 'returns false ' do
      passenger.collect_luggage

      expect(passenger.luggage_dropped?).to eq false
    end

    it 'outputs that luggage has been collected' do
      expect(passenger.collect_luggage).to eq('Luggage collected!')
    end

    it 'raises error if already collected' do
      subject.collect_luggage

      expect { passenger.collect_luggage }.to raise_error('Passenger already got luggage!')
    end

    it 'raises error if still on plane' do
      passenger.boarded

      expect { passenger.collect_luggage }.to raise_error('Passenger still on plane!')
    end
  end
end
