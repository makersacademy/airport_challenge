require 'weather'

describe Weather do
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
    it 'returns true 20% of the time' do
      allow(subject).to receive(:chance).and_return(1)
      expect(subject.stormy?). to eq true
    end
  end
end
