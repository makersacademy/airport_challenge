require 'weather_report'

describe WeatherReport do

  it 'can report whether the weather is stormy' do
    expect(WeatherReport.new).to respond_to(:stormy?)
  end

  it 'can report whether the weather is sunny' do
    expect(WeatherReport.new).to respond_to(:sunny?)
  end

end
