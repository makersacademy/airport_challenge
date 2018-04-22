require 'weather'

describe Weather do

  subject(:weather) { Weather.new }

  describe '#stormy?' do
    it 'returns whether it is stormy or not' do
      expect(weather.stormy?).to eq(true).or eq(false)
    end
  end
end
