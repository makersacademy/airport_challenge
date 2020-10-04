require 'weather'
require 'airport'

describe Weather do
  describe 'weather_report' do
    it 'returns "stormy" when chance_of_storms is >= 7' do
      airport = Airport.new
      allow(airport).to receive(:chance_of_storms).and_return(8)
      expect(airport.weather_report).to eq("stormy")
    end

    it 'returns "sunny" when chance_of_storms is < 7' do
      airport = Airport.new
      allow(airport).to receive(:chance_of_storms).and_return(6)
      expect(airport.weather_report).to eq("sunny")
    end
  end
end
