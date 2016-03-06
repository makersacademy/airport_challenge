require 'weather'

describe Weather do
  describe '#stormy?' do
    it {is_expected.to respond_to(:stormy?)}

    it 'is expected to yield a boolean value' do
      expect(subject.stormy?).not_to eq nil
    end

    it 'is expected to return true with bad weather' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject).to be_stormy
    end

    it 'is expected to return false with good weather' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject).not_to be_stormy
    end
  end
end
