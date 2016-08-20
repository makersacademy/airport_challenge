class Weather

attr_reader :forecast

def initialize
  @forecast = ""
  generate_weather
end

def weather_chance
  1+rand(100)
end

def generate_weather
  if (1..80).include? weather_chance
    @forecast = "Sunny"
  else
   @forecast = "Stormy"
  end
end


end
