require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe "#stormy?" do
    it 'can be not stormy' do
      allow(weather).to receive(:stormy?).and_return true
      expect(weather.stormy?).to eq(true)
    end

    it 'can be stormy' do
      allow(weather).to receive(:stormy?).and_return false
      expect(weather.stormy?).to eq(false)
    end
  end
end
