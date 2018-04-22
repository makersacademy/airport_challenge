 require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
  end

  it { is_expected.to respond_to(:wind_speed) }
  describe '#wind_speed' do
    it { is_expected.to respond_to(:wind_speed) }
  end
end
