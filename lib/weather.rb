class Weather
  def initialize
    @current_weather_conditon = "sunny"
    @weather_chance = 50
  end

  def show_current_weather_condition
    @current_weather_conditon
  end

  def change_weather_condition
    @current_weather_conditon = "stormy" if @weather_chance == 50
  end
end

private

def change_weather_chance
  @weather_chance = 50
end
