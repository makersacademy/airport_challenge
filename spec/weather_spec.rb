require "weather"

describe Weather do
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
  end

  describe '#sunny?' do
    it { is_expected.to respond_to(:sunny?) }
  end
end
