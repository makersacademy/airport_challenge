require_relative 'plane'

class Airport

  attr_reader :landed_planes, :capacity, :hold_reason, :weather

  def initialize
    @landed_planes = Array.new
    @capacity = 20
    @hold_reason = String.new
    @weather = 75
  end

  def land_plane(plane)
    fail @hold_reason if at_capacity? || stormy?
    plane.land
    @landed_planes << plane
    @landed_planes
  end

  def clear_plane(plane)
    fail @hold_reason if stormy?
    plane.take_off
    @landed_planes.delete(plane)
    @landed_planes
  end

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

  private
  def at_capacity?
    return false unless @landed_planes.count >= @capacity
    @hold_reason = "Maintain holding pattern -> Airport at Capacity"
    return true
  end

  def stormy?
    storm_index = Random.rand(100)
    return false unless storm_index > @weather
    @hold_reason = "Maintain holding pattern -> Stormy Weather"
    return true
  end

end
