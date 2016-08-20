class Weather

  def stormy_weather
    weather = Random.rand(100)
    weather > 20 ? false : true
  end

end
