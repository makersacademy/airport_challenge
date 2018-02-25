class Weather
  def stormy?
    return true if weather_generator == 1
    false
  end
  private
  def weather_generator
    rand(2)
  end
end
