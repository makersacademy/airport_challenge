require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes
  CAPACITY = 10

  def initialize
    @planes = []
  end

  def land(plane)
    raise "too stormy to land" if weather_check == "stormy"
    raise "Airport full" if full?
    if @planes.include?(plane)
      raise "This plane has already landed"
    else
      @planes << plane
      plane.plane_landed
    end
  end

  def take_off(plane)
    raise "too stormy to take off" if weather_check == "stormy"
    @planes.delete(plane)
    plane.plane_taking_off
  end

  def weather_check
    current_weather = Weather.new
    "stormy" if current_weather.stormy?
  end

  def full?
    @planes.count >= CAPACITY
  end

end
