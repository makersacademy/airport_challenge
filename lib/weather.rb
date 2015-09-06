module Weather
  def stormy?
    weather_randomiser <= 2 ? true : false
  end
  def weather_randomiser
    rand(10)
  end
end
