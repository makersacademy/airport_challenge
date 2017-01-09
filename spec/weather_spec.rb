require 'weather'

describe Weather do
  it 'determines the current weather' do
    expect(subject).to respond_to :weather_generator
    expect(Weather::WEATHER_CONDITIONS.include?(subject.current_weather)).to eq true
  end
  it 'can be "Sunny"' do
    allow(subject).to receive(:weather_generator) { 'Sunny' }
    expect(subject.weather_generator).to eq 'Sunny'
  end
  it 'can be "Stormy"' do
    allow(subject).to receive(:weather_generator) { 'Stormy' }
    expect(subject.weather_generator).to eq 'Stormy'
  end
end
