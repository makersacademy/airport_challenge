require_relative '../lib/plane'

describe Plane do
  describe '#airbourne?' do
    it { is_expected.to respond_to(:airbourne?) }
  end
end
