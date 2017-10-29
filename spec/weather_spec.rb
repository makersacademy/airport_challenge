require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    weather = Weather.new
    it { expect(weather.stormy?).to be_true.or be false }
  end
end
