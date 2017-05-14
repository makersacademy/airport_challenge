class Weather

  def initialize
    @current_weather_conditon = "sunny"
  end

  def check_current_weather_condition
    change_weather_condition
    @current_weather_conditon
  end

private

  def change_weather_chance
    rand(1...100)
  end

  def change_weather_condition
    if change_weather_chance >= 85
      @current_weather_conditon = "stormy"
    else
      @current_weather_conditon = "sunny"
    end
  end
end
