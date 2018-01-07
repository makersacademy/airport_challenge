require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'should return a boolean' do
      expect(weather.stormy?).to_not be_nil
    end
  end

  describe '#update' do
    it 'should make weather one of :stormy, :sunny, :cloudy, :rainy' do
      expect([:stormy, :sunny, :cloudy, :rainy]).to include(weather.update)
    end
  end

  describe '@weather' do
    it 'should be one of :stormy, :sunny, :cloudy, :rainy' do
      expect([:stormy, :sunny, :cloudy, :rainy]).to include(weather.outlook)
    end
  end
end
