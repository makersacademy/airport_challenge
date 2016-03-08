require 'weather'

describe Weather do
  subject(:weather) { described_class.new }


  describe '#stormy?' do
    it 'is expected to yield a boolean value' do
      expect(weather.stormy?).not_to eq nil
    end

    it 'is expected to return true with bad weather' do
      allow(Kernel).to receive(:rand).and_return(4)
      expect(weather).to be_stormy
    end

    it 'is expected to return false with good weather' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(weather).not_to be_stormy
    end
  end
end
