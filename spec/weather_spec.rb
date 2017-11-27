require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#initialization' do
    it 'generate a weather' do
      expect(weather.stormy?).to eq(true).or eq(false)
    end
  end
end
