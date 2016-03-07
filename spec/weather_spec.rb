require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'creates a sunny weather' do
      good_weather = weather.stormy? Random.rand(3..10)
      expect(good_weather).to eq false
    end

    it 'creates a stormy weather' do
      bad_weather = weather.stormy? Random.rand(1..2)
      expect(bad_weather).to eq true
    end
  end
end
