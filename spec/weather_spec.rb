describe Weather do

  describe '#stormy?' do
    it 'returns true or false' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
