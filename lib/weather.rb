class Weather

  attr_accessor :weather_condition

  def set_weather_integer
    @weather_condition = rand(0..100)
  end

  def stormy?
    set_weather_integer
    return true if @weather_condition >= 85
    return false
  end
end
