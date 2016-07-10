class WeatherState

attr_accessor :weather

def initialize
  @weather = self.weather_generator
end

def weather_generator
  generator = 1 + rand(5)
  if generator == 5
    @weather = 'stormy'
  else
    @weather = 'sunny'
  end
end

end
