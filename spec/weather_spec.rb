require 'weather'

describe Weather do

  describe '.is_sunny?' do
    it 'when rand is less than 8 (out of 10)' do
      allow(Weather).to receive(:rand).and_return(7)
      expect(Weather).to be_sunny
      allow(Weather).to receive(:rand).and_return(8)
      expect(Weather).not_to be_sunny
    end
  end

end
