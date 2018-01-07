require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'can land more than one plane' do
      allow(plane).to receive(:lands)
      expect { 2.times { airport.land plane } }.to_not raise_error
    end
  end

  describe '#planes' do
    context 'when planes land' do
      it 'should show all the planes' do
        allow(plane).to receive(:lands)
        2.times { airport.land plane }
        expect(airport.planes).to eq [plane, plane]
      end
    end
  end

  describe '#take_off' do
    before do
      allow(plane).to receive(:lands)
      allow(plane).to receive(:takes_off)
    end

    it 'raises an exception when there are no planes to take off' do
      expect { airport.take_off }.to raise_error 'Airport is empty!'
    end

    it 'allows a plane to take off' do
      airport.land plane
      expect(airport.take_off).to eq plane
    end

    it 'cannot takeoff in stormy weather' do
      airport.land plane
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.take_off }.to raise_error 'Could not complete takeoff due to weather'
    end
  end
end
