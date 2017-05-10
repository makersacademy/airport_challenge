require 'weather'

describe Weather do
  describe '#stormy?' do

    it 'retruns true if the weather condition is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end

    it 'retuns false if the weather condition is normal' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.stormy?).to eq(false)
    end
  end
end
