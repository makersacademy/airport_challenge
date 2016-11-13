require 'weather'

describe Weather do

  subject(:weather) {described_class.new}

  context 'checking the weather' do
    it 'can be sunny' do
      allow(weather).to receive(:stormy?) {false}
      expect(weather.stormy?).to be false
    end

    it 'can be stormy' do
      allow(weather).to receive(:stormy?) {true}
      expect(weather.stormy?).to be true
    end
  end
end
