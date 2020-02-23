class WeatherReport

  def current_weather
    # 0 - 5 where 0 is stormy, 1 - 5 is sunny
    weather = rand(6)
    weather.zero? ? "stormy" : "sunny"
  end

end
