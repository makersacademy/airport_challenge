require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy!) }
  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    it 'returns stormy = true when weather set to stormy!' do
      subject.stormy!
      expect(subject.stormy?).to be(true)
    end
  end

end
