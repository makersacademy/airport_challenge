class Weather

  def stormy_weather
    @stormy_weather = stormy_weather_randomiser
  end

private
  def stormy_weather_randomiser
    rand(0...10) < 1
  end

end
