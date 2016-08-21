require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "too stormy to land" if weather_check == "stormy"
    @planes << plane
  end

  def take_off(plane)
    raise "too stormy to take off" if weather_check == "stormy"
    @planes.delete(plane)
  end

  def weather_check
    current_weather = Weather.new
    "stormy" if current_weather.stormy?
  end

end
