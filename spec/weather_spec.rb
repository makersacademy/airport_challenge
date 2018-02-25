require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns the weather is stormy' do
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return true
    end

    it 'returns the weather is sunny' do
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return false
    end
  end
end
