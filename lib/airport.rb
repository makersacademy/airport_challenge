require_relative 'plane'

class Airport < Plane

  def initialize
    @weather = weather
  end

  def weather
    weather_array = ['stormy', 'sunny', 'sunny', 'sunny']
    current_weather = weather_array[rand(weather_array.size)] #
    puts current_weather
  end

end
