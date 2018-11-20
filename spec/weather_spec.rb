require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it " has a current weather vaiable that can be stormy" do
    weather.set_weather_good
    weather.set_weather_stormy
    expect(weather.current_weather).to eq 'storm'
    end

  it " has a current weather variable that can be set to good" do
    weather.set_weather_stormy
    weather.set_weather_good
    expect(weather.current_weather).to eq 'good'
  end

end 
