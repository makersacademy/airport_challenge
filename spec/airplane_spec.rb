require 'airplane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it { is_expected.to respond_to :take_off}

    it 'raise an error if already flying' do
      expect { plane.take_off }
    end
  end
end
