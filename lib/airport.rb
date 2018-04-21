require 'plane'
require 'weather'

class Airport
  attr_reader :capacity, :landed_planes, :weather_acceptable

  def initialize(capacity = 10)
    @capacity = capacity
    @landed_planes = []
    @weather_acceptable = (rand <= 0.95)
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def change_weather(boolean)
    @weather_acceptable = boolean
  end

  def weather_check
    raise RuntimeError, 'Weather condition not acceptable' if @weather_acceptable == false
  end

  def land_plane(plane)
    weather_check
    if @landed_planes.length >= @capacity
      raise RuntimeError, 'Airport at capacity'
    end
    @landed_planes << plane
    "#{plane} plane landed"
  end

  def plane_take_off(plane)
    weather_check
    if @landed_planes.include?(plane) == false
      raise RuntimeError, 'Plane not in airport'
    end

    @landed_planes.delete(plane)
    "#{plane} plane has taken off"
  end
end
