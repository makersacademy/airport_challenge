class Weather
  WEATHER_VARIABLES = { 1 => "CLEAR_SKIES", 2 => "OVERCAST", 3 => "RAIN",
     4 => "FOG", 5 => "STORMY", 6 => "SNOW", 7 => "WINDY" }.freeze
  def initialize
    
  end

  def random_selector
    rand(7)
  end 

  def weather
    WEATHER_VARIABLES[random_selector]
  end 

end
