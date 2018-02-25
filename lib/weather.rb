require_relative 'airport'
class Weather
  def stormy?
    weather_generator == 1
  end
  
  def weather_generator
    rand(2)
  end
end
