require 'weather'

describe Weather do

  describe '.is_sunny?' do
    it 'returns true when weather_severity < 5' do
      allow(Weather).to receive(:rand).and_return(3)
      expect(Weather).to be_sunny
    end

    it 'returns true when weather_severity > 5' do
      allow(Weather).to receive(:rand).and_return(6)
      expect(Weather).not_to be_sunny
    end
  end

end
