class Weather

  def stormy?
    type_of_weather == :stormy
  end

  private
  POTENTIAL_WEATHERS = [:stormy, :cloudy, :rainy, :sunny, :dry]

  def type_of_weather
    POTENTIAL_WEATHERS[Random.rand(5)]
  end

end
