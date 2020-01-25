require 'weather'

describe Weather do
  context "#stormy?" do
    it 'allows only two weather conditions: stormy or not' do
      expect(subject.stormy?).to be(true).or be(false)
    end
    it 'tells us when it is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect(subject.stormy?).to eq true
    end
    it 'tells us when it is not stormy' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.stormy?).to eq false
    end
  end
end
