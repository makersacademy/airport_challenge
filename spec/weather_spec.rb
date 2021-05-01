require './lib/weather.rb'

describe Weather do
  describe 'get_current' do
    it 'returns "stormy"' do
      expect(Weather.get_current).to eq("Stormy")
    end
  end
end