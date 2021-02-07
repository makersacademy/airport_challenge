require "weather_station"

describe WeatherStation do 
  it "checks local weather" do 
    expect(subject.check_weather).to eq("Stormy").or eq("Sunny")
  end 
end 
