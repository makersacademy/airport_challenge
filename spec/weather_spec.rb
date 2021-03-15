require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  it 'accepts multiple weather predictions' do
    expect(subject.weather_predictions).to eq Weather::WEATHER_PREDICTIONS
  end

  it { is_expected.to respond_to :forecast }

  describe '#forecast' do
    it 'returns one of the weather predictions' do
      forecast = weather.forecast
      expect(subject.weather_predictions).to include forecast
    end 
  end

  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns true if the forecast is stormy' do
      allow(subject).to receive(:forecast) { :stormy }
      expect(subject.stormy?).to eq true
    end
  end

    
end
