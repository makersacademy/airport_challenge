require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'raises an error if plane already flying' do
      expect { plane.take_off }.to raise_error "Cannot take off: Plane already in air"
    end
  end
end
