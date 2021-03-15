require 'safe_weather'
require 'weather'
require 'airport'

describe SafeWeather do
  describe '#wind' do
    it { is_expected.to respond_to :wind }
    it 'should call the weather unsafe if the wind is strong than 10' do
      windy_weather = Weather.new(12)
      expect(subject.wind(windy_weather)).to eq false
    end
  end

  describe '#storm' do
    it { is_expected.to respond_to :storm }
    it 'should call the weather unsafe when wind and rain are too strong' do
      stormy_weather = Weather.new(8, 0, -10)
      expect(subject.storm(stormy_weather)).to eq false
    end
  end

  describe '#snow' do
    it { is_expected.to respond_to :snow }
    it 'should call the weather unsafe when temperatures are too low combined with chance of rain(snow)' do
      snowy_weather = Weather.new(2, 50, -10)
      expect(subject.snow(snowy_weather)).to eq false
    end
  end

  describe '#winter' do
    it { is_expected.to respond_to :winter }
    it 'should call the weather unsafe when temperatures are too low combined with high winds' do
      winter_weather = Weather.new(8, 0, -10)
      expect(subject.winter(winter_weather)).to eq false
    end
  end

  describe '#freezing' do
    it { is_expected.to respond_to :freezing }
    it 'should call the weather unsafe if temperatures are too low' do
      freezing_weather = Weather.new(0, 0, -20)
      expect(subject.freezing(freezing_weather)).to eq false
    end
  end

  describe '#safety_check' do
    it { is_expected.to respond_to :safety_check }
    it 'is safe to fly!' do
      safe_weather = Weather.new(0, 2, 10)
      expect(subject.safety_check(safe_weather)).to eq true
    end
  end
end
