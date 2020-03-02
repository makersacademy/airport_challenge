require 'weather'

describe Weather do

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }
    it { expect([true, false]).to include(subject.stormy?) }
  end

end
