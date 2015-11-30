require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport}

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }
    it 'raises an error if already flying' do
      expect { plane.takeoff }.to raise_error 'plane already in the air'
    end
  end

  describe '#land' do
    it 'keeps track of airport in which plane landed' do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end
    it 'raises an error if already landed' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error 'plane already landed'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport }
    it 'raises an error if already flying' do
      expect { plane.airport }.to raise_error 'plane already in the air'
    end
  end

end
