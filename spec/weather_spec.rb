describe Weather do

  describe '#stormy?' do
    it 'can return stormy' do
      weather = Weather.new
      allow(Kernel).to receive(:rand).and_return(5)
      expect(weather.stormy?).to be(true)
    end
    it 'can return sunny' do
      weather = Weather.new
      allow(Kernel).to receive(:rand).and_return(3)
      expect(weather.stormy?).to be(false)
    end
  end
end
