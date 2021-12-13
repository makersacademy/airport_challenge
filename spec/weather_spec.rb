require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }
  it { is_expected.to respond_to :set }

  describe '#stormy?' do
    it 'returns true if weather is stormy' do
      expect(subject.stormy?).to be true
    end
  end

  describe '#set' do
    it 'randomly sets the weather condition' do
      expect(subject.set).to eq(0).or eq(1)
    end
  end

end
