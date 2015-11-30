require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }
    it 'raises an error if already flying' do
      expect { plane.takeoff }.to raise_error 'plane already in the air'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to :land }
    it 'raises an error if already landed' do
      expect { plane.land }.to raise_error 'plane already landed'
    end
  end

end
