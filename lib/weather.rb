class Weather

  def check_weather
    rand(10)
  end

  def stormy?
    check_weather < 2
  end

end
