require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  describe '#weather_conditions' do
    it 'should report stormy weather' do
      allow(weather).to receive(:rand) { 5 }
      expect(weather.weather_conditions).to eq true
    end

    it 'should report fine weather' do
      allow(weather).to receive(:rand) { 4 }
      expect(weather.weather_conditions).to eq false
    end
  end
end
