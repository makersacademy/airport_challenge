require 'weather'

describe Weather do

  let(:weather) { double(:weather) }
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns as true when stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq true
    end

    it 'returns as false when clear' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(weather.stormy?).to eq false
    end
  end
end
