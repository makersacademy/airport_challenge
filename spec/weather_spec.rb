require 'weather'
  describe Weather do
    it 'returns false / true on random weather' do
      allow(Weather).to receive(:rand).and_return(7)
      expect(Weather.weather?).to eq false
      allow(Weather).to receive(:rand).and_return(9)
      expect(Weather.weather?).to eq true
    end
  end


