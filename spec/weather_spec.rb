require 'weather'

srand(1234)

describe Weather do

  describe '.is_sunny?' do
    it 'returns true when weather_severity < 5' do
      expect(Weather).to be_sunny #random set to 3
    end

    it 'returns true when weather_severity > 5' do
      expect(Weather).not_to be_sunny #random set to 6
      expect(Weather).not_to be_sunny #random set to 5
    end
  end

end
