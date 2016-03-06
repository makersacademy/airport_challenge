class Weather
  def stormy?
    weather_type == :stormy
  end

  private

  def weather_type
    :stormy if chances_of_stormy
  end

  def chances_of_stormy
    rand > 0.8
  end

end
