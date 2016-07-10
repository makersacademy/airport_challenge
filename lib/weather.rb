class Weather

  # Set a percentage which will act as the proportion of the time that the
  # weather will be stormy (out of 100).
  STORMY_PERCENTAGE = 20

  def stormy?
    weather_is_stormy?
  end

  private

  def weather_is_stormy?
    rand()*100 < STORMY_PERCENTAGE
  end

end
