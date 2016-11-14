class Weather

  attr_reader :weather_condition

  def stormy?
    set_weather_integer
    @weather_condition >= 85
  end

  def set_weather_integer
    @weather_condition = rand(0..100)
  end

end
