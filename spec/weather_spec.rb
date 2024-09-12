require 'weather'

describe Weather do
  it "weather_status method returns either good or stormy" do
    weather = Weather.new
    expect(weather.weather_status).to satisfy { |weather|
      weather == 'good' || weather == 'stormy'
    }
  end
end
