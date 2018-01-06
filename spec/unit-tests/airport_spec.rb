require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'has a land method' do
      is_expected.to respond_to(:land).with(1).argument
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
        airport.land plane
        expect( airport.planes[0] ).to eq plane
      end
      it 'should show all the planes' do
        2.times { airport.land plane }
        expect( airport.planes ).to eq [plane, plane]
      end
    end
  end
end
