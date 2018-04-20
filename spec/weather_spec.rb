require 'weather'

describe Weather do
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
  end

  describe '#wind_speed' do
    it { is_expected.to respond_to(:wind_speed) }
  end
end
