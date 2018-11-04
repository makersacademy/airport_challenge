class Weather

  def rand_weather
    rand(100)
  end

  def stormy
    true if rand_weather <= 20
    false if rand_weather > 20
  end

  def weather_error
    fail 'action unavaible its stormy'
  end

end
