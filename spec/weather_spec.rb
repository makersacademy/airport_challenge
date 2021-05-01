require './lib/weather.rb'

describe Weather do
  describe 'get_current' do
    it 'returns either "Stormy" or "Sunny"' do
      #not the best test, could only return 'Stormy' and still pass
      weather = ['Stormy', "Sunny"]
      expect(weather.include?(Weather.get_current)).to eq(true)
    end
  end
end