require 'weather'

describe Weather do

  subject(:weather) { described_class.new }
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns as true when stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather).to be_stormy
    end

    it 'returns as false when clear' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(weather.stormy?).to be false
    end
  end
end
