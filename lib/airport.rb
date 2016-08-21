require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    current_weather = Weather.new
    raise "too stormy to take off" if current_weather.stormy?
    @planes.delete(plane)
  end
end
