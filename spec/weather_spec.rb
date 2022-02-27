require 'weather'

describe Weather do
  let(:weather) { Weather.new }
  
  it 'generates a weather report' do
    expect(weather.weather_report).to eq("Sunny").or eq("Stormy")
  end
end