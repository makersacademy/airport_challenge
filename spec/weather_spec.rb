require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }
  subject(:weather) { Weather.new }

  describe '#stormy?' do
    it 'returns the weather is stormy' do
      allow(weather).to receive(:rand).and_return(0)
      expect(weather.stormy?).to eq true
    end

    it 'returns the weather is sunny' do
      allow(weather).to receive(:rand).and_return(3)
      expect(weather.stormy?).to eq false
    end
  end
end
