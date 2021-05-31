require './lib/weather.rb'

describe Weather do
  it "weather_status method == good or stormy" do
    weather = Weather.new
    expect(weather.weather_status).to eq('good').or(eq('stormy'))
  end
end
