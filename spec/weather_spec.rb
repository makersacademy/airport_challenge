require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  describe '#stormy?' do
    it 'can be stormy' do
      weather.forecast > 1
      expect(weather).to be_stormy
    end
  end

  it 'has a default chance of stormy-ness' do
    expect(weather.forecast).to eq Weather::FORECAST_STORM
  end

end
