require './lib/weather.rb'

describe Weather do
  let (:weather) { subject }

  it 'should generate a random weather condition' do
    weather = subject
    expect(Weather::CONDITIONS).to include weather.condition
  end
  describe '#stormy' do
    it 'should return true if conditions are stormy' do
      allow(weather).to receive(:condition) { "Stormy" }

      expect(weather.stormy?).to eq true
    end
  end
end