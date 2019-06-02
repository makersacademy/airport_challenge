require 'spec_helper'
require 'weather_report'

describe WeatherReport do
  it 'can only be one of 10 options' do
    weather = WeatherReport.new
    expect(weather.forecast).to match(/clear|sunny|partly cloudy|light rain|light fog|overcast|showers|stormy|stormy|stormy/)
  end
end
