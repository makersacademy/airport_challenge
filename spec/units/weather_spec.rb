require 'weather'

RSpec.describe Weather do
  describe '#stormy?' do
    it 'can be true' do
      weather = Weather.new
      allow(Kernel).to receive(:rand).and_return(3)

      expect(weather.stormy?).to eq(false)
    end

    it 'can be false' do
      weather = Weather.new
      allow(Kernel).to receive(:rand).and_return(5)

      expect(weather.stormy?).to eq(true)
    end
  end
end
