require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'it can be stormy' do
      allow(weather).to receive(:rand).and_return(15)
      expect(weather.stormy?).to eq true
    end

    it 'is can be sunny' do
      allow(weather).to receive(:rand).and_return(50)
      expect(weather.stormy?).to eq false
    end

  end
end
