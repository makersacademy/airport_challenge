require 'weather.rb'

describe Weather do

  describe '#stormy?' do

    it 'returns true if random_weather is :stormy' do
      allow(subject).to receive(:random_weather) {:stormy}
      expect(subject.stormy?).to eq true
    end

    it 'returns false if random_weather is :sunny' do
      allow(subject).to receive(:random_weather) {:sunny}
      expect(subject.stormy?).to eq false
    end

  end

  describe '#random_weather' do
    #it returns a random weather state from WEATHER
  end

end
