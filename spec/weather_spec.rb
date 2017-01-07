require 'weather'

describe Weather do
  it 'determines the current weather' do
    expect(subject).to respond_to :weather_generator
    expect(Weather::WEATHER_CONDITIONS.include?(subject.current_weather)).to eq true
  end
end
