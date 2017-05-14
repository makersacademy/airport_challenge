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
    fail @hold_reason if in_airport?(plane)
    fail "Maintain holding pattern #{@hold_reason}" if at_capacity? || stormy?
    plane.land
    @landed_planes << plane
    @landed_planes
  end

  def clear_plane(plane)
    raise "Cannot clear plane #{@hold_reason}" unless green_light?(plane)
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
    @hold_reason = "-> Airport at Capacity"
    return true
  end

  def stormy?
    storm_index = Random.rand(100)
    return false unless storm_index > @weather
    @hold_reason = "-> Stormy Weather"
    return true
  end

  def in_airport?(plane)
    if @landed_planes.include?(plane)
      @hold_reason = "Plane already in airport"
      return true
    else
      @hold_reason = "-> Plane not in airport"
      return false
    end
  end

  def all_planes_landed?
    landed_planes.each do |plane|
      return false if plane.landing_status != "landed"
    end
    return true
  end

  def green_light?(plane)
    return !stormy? && in_airport?(plane) && all_planes_landed?
  end

end
