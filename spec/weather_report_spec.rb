require 'weather_report'

describe WeatherReport do
  it 'generates a weather report' do
    expect(subject).to be_a(WeatherReport)
  end

end
