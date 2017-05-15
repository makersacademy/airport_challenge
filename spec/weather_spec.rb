require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe '#randomizer' do
    it 'gives a random value between 1 and 10' do
      expect(weather.randomizer).to be_between(1, 10)
    end
  end

  describe '#stormy?' do
    
  end
end
