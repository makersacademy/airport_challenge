class Weather

  attr_reader :current_weather
  
  def initialize
    decides_weather
  end

  private

  def decides_weather
    weather_generator = rand(1..10)
    weather_generator == 10 ? @current_weather = "stormy" : @current_weather = "sunny"
  end

end
