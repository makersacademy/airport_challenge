require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe '#weather_report' do
    it 'shows when the weather is stormy' do
      allow(subject.number_generator).to receive(:rand) { 1 }
      expect(subject.weather_report).to eq :stormy
    end

    it 'shows when the weather is sunny' do
      allow(subject.number_generator).to receive(:rand) { 2 }
      expect(subject.weather_report).to eq :sunny
    end
  end
end
