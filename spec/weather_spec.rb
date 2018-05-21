require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'is not stormy' do
      expect(weather.stormy?).to be false
    end
    it 'is stormy' do
      expect(weather.stormy?).to be true
    end
  end

end
