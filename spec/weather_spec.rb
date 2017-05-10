require 'weather'
describe Weather do
  describe '#stormy?' do
    it 'is expected to return true when weather is stormy' do
      weather = Weather.new
      allow(weather).to receive(:rand).and_return(1.1)
      expect(weather.stormy?).to be_truthy
    end
  end

  it 'is expected to return false when weather is not stormy' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(0.1)
    expect(weather.stormy?).to be_falsy
  end
end
