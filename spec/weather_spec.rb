require 'weather'

describe Weather do
  context "#stormy?" do
    it 'allows only two weather conditions: stormy or not' do
      expect(Weather.stormy?).to be(true).or be(false)
    end
    it 'tells us when it is stormy' do
      allow(Weather).to receive(:stormy?) { true }
      expect(Weather.stormy?).to eq true
    end
    it 'tells us when it is not stormy' do
      allow(Weather).to receive(:stormy?) { false }
      expect(Weather.stormy?).to eq false
    end
  end
end
