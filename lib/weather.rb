class Weather
  attr_reader :weather_condition

  def initialize
    set_weather_integer
  end

  def set_weather_integer
    @weather_condition = rand(0..100)
  end

  def stormy?
    return true if @weather_condition >= 85
    return false
  end
end
