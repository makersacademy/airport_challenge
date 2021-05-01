require './lib/weather.rb'

describe Weather do
  describe 'get_current' do
    it 'returns either "Stormy" or "Sunny"' do
      weather = ['Stormy', "Sunny"]
      expect(weather.include?(Weather.get_current)).to eq(true)
    end
  end
end