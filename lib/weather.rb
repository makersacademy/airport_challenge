class Weather
  attr_reader :weather
  
  FORECAST = {
    1 => 'stormy',
    2 => 'sunny',
    3 => 'sunny',
    4 => 'sunny',
    5 => 'stormy',
    6 => 'sunny'
  }

  def initialize
    @weather = weather_forecast
  end

  def random_number
    rand(1..6)
  end
    
  def weather_forecast
    FORECAST[random_number]
  end
end
