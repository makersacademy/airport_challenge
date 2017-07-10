require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    it 'returns true if stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq(true)
    end
  end
end
