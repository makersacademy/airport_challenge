class Weather

  def stormy?
    weather_now == 0
  end

  def weather_now
    rand(20)
  end
end
