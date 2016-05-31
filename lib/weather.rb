class Weather
  attr_reader :current_weather, :number
  def initialize
    @number = random_weather
    @current_weather = type(@number)
  end
  
  private

  DEFAULT_SUN = 50
  DEFAULT_RAIN = 70
  MAX_WEATHER = 100

  def random_weather
    rand * MAX_WEATHER
  end

  def type(number)
    return :sunny if number < DEFAULT_SUN
    return :raining if number < DEFAULT_RAIN
    :stormy
  end

end
