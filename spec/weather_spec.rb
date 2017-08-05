require 'weather'

describe Weather do

  subject(:weather) { described_class.new }
  it { is_expected.to respond_to :stormy? }

  it 'is more likely to be sunny than stormy' do
    forecast = Weather::CONDITIONS
    expect(forecast.count(:clear) > forecast.count(:storm)).to eq true
  end

  describe '#stormy?' do
    it 'returns a boolean value' do
      expect(weather.stormy?).to eq(true).or(eq(false))
    end
  end
end
