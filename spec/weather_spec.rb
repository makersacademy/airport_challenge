describe Weather do
  describe '#stormy?' do
    it 'returns true or false if weather is stormy' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
