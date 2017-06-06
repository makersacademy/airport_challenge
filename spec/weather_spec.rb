require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe '#randomizer' do
    it 'gives a random value between 1 and 10' do
      expect(weather.randomizer).to be_between(1, 10)
    end
  end

  describe '#stormy?' do
    it 'sets #stormy? as false when randomizer above 3' do
      allow(weather).to receive(:randomizer) { 6 }
      expect(weather.stormy?).to eq false
    end
    it 'sets #stormy? as false when randomizer below 3' do
      allow(weather).to receive(:randomizer) { 2 }
      expect(weather.stormy?).to eq true
    end
  end
end
