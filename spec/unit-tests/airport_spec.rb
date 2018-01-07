require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'has a land method' do
      is_expected.to respond_to(:land).with(1).argument
    end
    it 'can land a plane' do
      allow(plane).to receive(:lands)
      expect { airport.land plane }.to_not raise_error
    end
    it 'can land more than one plane' do
      allow(plane).to receive(:lands)
      expect { 2.times { airport.land plane } }.to_not raise_error
    end
  end

  describe '#planes' do
    it 'has a planes method' do
      is_expected.to respond_to(:planes)
    end
    it 'should return an object' do
      is_expected.to be_truthy
    end
    context 'when planes land' do
      it 'should show a single landed plane' do
        allow(plane).to receive(:lands)
        airport.land plane
        expect(airport.planes[0]).to eq plane
      end
      it 'should show all the planes' do
        allow(plane).to receive(:lands)
        2.times { airport.land plane }
        expect(airport.planes).to eq [plane, plane]
      end
    end
  end

  describe '#take_off' do
    it 'has a planes method' do
      is_expected.to respond_to(:take_off)
    end
    it 'allows a plane to take off' do
      allow(plane).to receive(:lands)
      allow(plane).to receive(:takes_off)
      airport.land plane
      expect(airport.take_off).to eq plane
    end
    it 'raises an exception when there are no planes to take off' do
      expect { airport.take_off }.to raise_error 'Airport is empty!'
    end
  end
end
