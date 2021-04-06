require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#take of' do
    it { is_expected.to respond_to :take_off }

    it 'raises error when flying' do 
      expect { plane.take_off }.to raise_error 'cant take off, already flying'
    end
  end

  describe '#land' do
    it 'store the airport where plane land' do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end 

    it 'raise an error if landed' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error ' plane already landed'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport }

    it 'raises error if flying ' do
      expect { plane.airport }.to raise_error 'plane not at airport, flying'
    end
  end
end 
#hshgdfhjasg