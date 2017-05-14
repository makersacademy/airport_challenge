
class Weather
  attr_reader :weather_conditions

  # def initialize
  #   @weather_conditions = weather_conditions
  # end

  def weather?
    @weather_conditions = 1 + rand(10)
    if @weather_conditions <= 9
      :ok_weather
    else
      :stormy
  end
end
end
