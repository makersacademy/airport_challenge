class Weather

  def stormy?
    # [:sunny, :stormy]
    weather_generator == 1
  end

  private
  def weather_generator
    rand(2)
  end

end
