require 'weather'

describe Weather do

  describe '.is_sunny?' do
    it 'when weather_severity < 5' do
      allow(Weather).to receive(:rand).and_return(3)
      expect(Weather).to be_sunny
      allow(Weather).to receive(:rand).and_return(6)
      expect(Weather).not_to be_sunny
    end
  end

end
