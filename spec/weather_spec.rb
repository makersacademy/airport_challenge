describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do

    it 'returns false when weather is not stormy' do
      allow(Weather).to receive(:stormy?) { false }
      expect(subject.stormy?).to eq false
    end

    it 'returns true when weather is stormy' do
      allow(Weather).to receive(:stormy?) { true }
      expect(subject.stormy?).to eq true
    end

  end

end
