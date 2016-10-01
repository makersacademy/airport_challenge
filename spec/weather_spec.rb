require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  describe '#randomiser' do
    it 'returns a random number' do
      expect(subject.randomiser).to be_between(0, 5)
    end
  end

  describe '#weather forecast' do
    it 'tells you what the weather is like' do
      expect(subject.weather_forecast).to eq :heavy_cloud
    end
  end

  describe '#stormy?' do
    it 'determines whether the weather is stormy' do
      allow(weather).to receive(:weather_forecast).and_return (:stormy)
      expect(subject.stormy?). to eq true
    end
  end

  end
