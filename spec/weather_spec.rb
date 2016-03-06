require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe 'random weather' do

    it 'it should return true when stormy' do
      allow(weather).to receive(:random) { 5 }
      expect(weather.stormy?).to eq(true)
    end

    it 'should return false when not stormy' do
      allow(weather).to receive(:random) { 2 }
      expect(weather.stormy?).to eq(false)
    end
  end
end
