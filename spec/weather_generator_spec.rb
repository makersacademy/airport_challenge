require 'weather_generator'

describe WeatherGenerator do
  it 'responds to generate_weather' do
    expect(subject).to respond_to(:generate_weather)
  end
end
