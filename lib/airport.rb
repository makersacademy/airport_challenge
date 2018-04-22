require 'plane'

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

  def land_plane(plane)
    weather_check
    capacity_check
    plane_in_airport_check(plane, true)

    @landed_planes << plane
    "#{plane} plane landed"
  end

  def plane_take_off(plane)
    weather_check
    plane_in_airport_check(plane, false)

    @landed_planes.delete(plane)
    "#{plane} plane has taken off"
  end

  # Guard checks
  def weather_check
    raise RuntimeError, 'Weather not acceptable' unless @weather_acceptable
  end

  def capacity_check
    raise RuntimeError, 'Airport at capacity' if @landed_planes.length >= @capacity
  end

  def plane_in_airport_check(plane, reason)
    if reason
      # Raise an error if TRUE that a plane in the airport
      raise RuntimeError, 'Plane in airport' if @landed_planes.include?(plane)
    else
      # Raise an error if FALSE that a plane in the airport
      raise RuntimeError, 'Plane not in airport' unless @landed_planes.include?(plane)
    end
  end

end
