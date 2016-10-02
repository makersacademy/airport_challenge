require 'weather'

describe Weather do
  subject(:weather) {described_class.new}


  describe '#stormy?' do
    it 'tells you whether the weather is stormy' do
      allow(subject).to receive(:weather_forecast).and_return(:stormy)
      expect(subject.stormy?).to eq true
    end
  end

  # Removed as, whilst they pass, fails when moved to a private method

  # describe '#randomiser' do
  #   it 'returns a random number' do
  #     expect(subject.randomiser).to be_between(0, 5)
  #   end
  # end
  #
  # describe '#stormy?' do
  #   it 'determines whether the weather is stormy' do
  #     allow(weather).to receive(:weather_forecast).and_return (:stormy)
  #     expect(subject.stormy?). to eq true
  #   end
  # end

  end
