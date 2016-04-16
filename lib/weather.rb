class Weather

  def stormy?
    random_weather
  end

  def random_weather
    rand(20) <= 1 ? true : false
  end

end
