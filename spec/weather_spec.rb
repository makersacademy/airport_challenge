require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns true if weather is stormy' do
      expect(subject.stormy?).to be true
    end
  end

end
