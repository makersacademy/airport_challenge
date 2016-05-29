require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns false if weather is not stormy' do
      subject.stub(:storm_generator).and_return 1
      expect(subject.stormy?).to eq false
    end
    it 'returns true if weather is stormy' do
      subject.storm = true
      subject.stub(:storm_generator).and_return 0
      expect(subject.stormy?).to eq true
    end
  end
end
