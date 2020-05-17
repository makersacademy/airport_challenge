require 'weather'

describe Weather do
  describe '#generate' do
    it 'is sunny when randomly generated number is 80 or less' do
      allow(Weather).to receive(:rand).and_return(80)
      expect(Weather.generate).to eq 'sunny'
    end

    it 'is stormy when randomly generated number is over 80' do
      allow(Weather).to receive(:rand).and_return(81)
      expect(Weather.generate).to eq 'stormy'
    end
  end
end
