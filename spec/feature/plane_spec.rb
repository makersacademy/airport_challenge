require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'raises an error if already flying' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off: plane already flying'
    end
  end

  describe '#aiport' do
    it { is_expected.to respond_to(:airport)}
    it 'raises an error if already flying' do
      expect { plane.airport }.to raise_error 'Plane cannot be at an aiport: plane already flying'
    end
  end

end
