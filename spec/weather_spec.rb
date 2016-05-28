require 'weather'

describe Weather do
  describe '#is_stormy?' do
    it 'returns false if weather is not stormy' do
      expect(subject.is_stormy?).to eq false
    end
    it 'returns true if weather is stormy' do
      subject.storm = true
      expect(subject.is_stormy?).to eq true
    end
  end
end
