require 'weather'

describe Weather do
  subject(:weather) {described_class.new}


  describe '#stormy?' do
    it 'tells you whether the weather is stormy' do
      allow(subject).to receive(:weather_forecast).and_return(:stormy)
      expect(subject.stormy?).to eq true
    end
  end

  end
