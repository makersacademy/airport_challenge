# class WeatherReport

  def current_weather(airport)
    # 0 - 5 where 0 is stormy, 1 - 5 is sunny
    current_weather = rand(6)
    current_weather.zero? ? "stormy" : "sunny"
  end

# end
