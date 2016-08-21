class Weather

attr_reader :forecast

def initialize
  @forecast = ""
  generate_weather(weather_chance)
end

def weather_chance
  1+rand(100)
end

def generate_weather(num)
  if (1..80).cover? num
    @forecast = "Sunny"
  else
   @forecast = "Stormy"
  end
end


end
