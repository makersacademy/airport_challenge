require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns false if weather is not stormy' do
      expect(subject.stormy?).to eq false
    end
    it 'returns true if weather is stormy' do
      subject.storm = true
      expect(subject.stormy?).to eq true
    end
  end
end
