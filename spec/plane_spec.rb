require 'plane'

describe Plane, :plane do
  describe '#flying?' do
    it { is_expected.to respond_to(:flying?) }
  end
end
