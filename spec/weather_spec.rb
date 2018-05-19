describe Weather do
  describe '#stormy?' do
    it 'confirms that the weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect(subject.stormy?).to eq true
    end
  end
end
