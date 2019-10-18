class Weather
  attr_reader :weather

  def weather
    @weather = ["sun", "rain", "snow", "fog", "storm"]
  end

  def weather_generator
    num = rand(weather.length)
    return weather[num]
  end
end
