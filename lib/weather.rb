class Weather
  def initialize
    @current_weather_conditon = "sunny"
  end

  def show_current_weather_condition
    @current_weather_conditon
  end

  def change_weather_chance
  end

  def change_weather_condition
    @current_weather_conditon = "stormy"
  end
end
