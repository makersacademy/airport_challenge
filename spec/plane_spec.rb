require 'airport'
require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#take_off' do
    it 'responds to take off' do
      expect(plane).to respond_to(:take_off)
    end
    it 'raises error if plane already flying' do
      expect { plane.take_off }.to raise_error "Plane already flying"
    end
  end
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'raises an error if plane is already landed' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error "Plane already landed"
    end
  end
  describe '#airport' do
    it 'responds to airport' do
      expect(plane).to respond_to(:airport)
    end
    it 'raises error if already flying' do
      expect { plane.airport }.to raise_error "Plane already flying"
    end
  end
end
