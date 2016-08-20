class Weather

attr_reader :forecast

def initialize
  @forecast = ""
  generate_weather
end

def generate_weather
  r = 1+rand(100)
  if (1..75).include? r
    @forecast = "Sunny"
  else
   @forecast = "Stormy"
  end
end


end
