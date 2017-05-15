require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :landed_planes, :capacity, :hold_reason

  def initialize
    @landed_planes = Array.new
    @hold_reason = "Permission denied"
    @capacity = 20
  end

  def land_plane(plane, weather)
    fail @hold_reason if at_capacity? || weather.stormy? || in_airport?(plane)
    plane.land
    @landed_planes << plane
  end

  def clear_plane(plane, weather)
    fail @hold_reason unless in_airport?(plane) && !weather.stormy?
    plane.take_off
    @landed_planes.delete(plane)
    @landed_planes
  end

  def override_airport_capacity(new_capacity)
    @capacity = new_capacity
  end

  private
  def at_capacity?
    @landed_planes.count >= @capacity
  end

  def in_airport?(plane)
    @landed_planes.include?(plane)
  end
end
