require './lib/airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { Plane.new }
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'will not let planes land if full' do
      allow(airport).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Airport capacity full."
    end

    it 'will not land when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "There is a storm: cannot land."
    end
  end
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'will not take off when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error "There is a storm: cannot take off."
    end
  end

end
