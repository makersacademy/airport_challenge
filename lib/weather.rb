require_relative 'airport'

class Weather < Airport

  def initialize
    @weather = [:stormy, :sunny, :light_rain, :heavy_cloud, :meh, :stormy]
  end

  def stormy?
    weather_forecast == :stormy
  end

  private

  # def randomiser
  #   rand(@weather.length-1)
  # end
  #
  def weather_forecast
    return @weather[randomiser]
  end

end
