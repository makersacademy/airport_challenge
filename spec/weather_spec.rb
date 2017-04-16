require 'weather'

describe Weather do

  subject(:weather) { described_class.new }
  it { is_expected.to respond_to :stormy? }

  it 'is more likely to be sunny than stormy' do
    forecast = Weather::CONDITIONS
    expect(forecast.count(:clear) > forecast.count(:storm)).to eq true
  end

  describe '#stormy?' do
    it 'returns as true when stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather).to be_stormy
    end

    it 'returns as false when clear' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(weather.stormy?).to be false
    end
  end
end
