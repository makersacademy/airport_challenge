require_relative '../lib/airport'

describe Airport do
  describe '#capacity?' do
    it { is_expected.to respond_to(:capacity?) }
  end
end
