require 'weather'

describe Weather do

  let(:weather) {described_class.new}

  describe '#stormy?'do

    it 'should report stormy as false when rand is 7 or less' do
      allow(weather).to receive(:rand) { 7 }
      expect(weather.stormy?).to eq false
    end

    it 'should report stormy as true when rand over 8' do
      allow(weather).to receive(:rand) { 9 }
      expect(weather.stormy?).to eq true
    end
  end
end
