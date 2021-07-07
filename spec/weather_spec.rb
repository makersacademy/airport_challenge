require_relative '../lib/weather.rb'

describe Weather do
  describe '#stormy' do
    it 'tests that when the random number is equal to 1 the weather is stormy' do
      weather = Weather.new
      allow(weather).to receive(:rand).and_return(1)
      expect(weather.stormy?).to eq true
    end
  end
end
