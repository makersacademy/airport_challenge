require 'weather'

describe Weather do
  subject(:weather) {described_class}

  describe '#stormy?' do
    it 'returns true of false' do
      expect([true, false]).to include Weather.stormy?
    end

    it 'returns true if rand is less than 3' do
      allow(Kernel).to receive(:rand).and_return(2)
      expect(weather.stormy?).to eq true
    end

    it 'returns false if rand is 3 or greater' do
      allow(Kernel).to receive(:rand).and_return(3)
      expect(weather.stormy?).to eq false
    end
  end

end
