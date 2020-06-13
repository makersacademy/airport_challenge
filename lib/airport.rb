require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5
  attr_reader :landed_planes, :airport_capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @airport_capacity = capacity
  end

  def land_plane(plane)
    raise "too stormy to land" if check_weather == "stormy"
    raise "no space" if full?
    @landed_planes << plane
    "#{plane} landed"
  end

  def take_off(plane)
    raise "too stormy to take off" if check_weather == "stormy"
    raise "plane not at airport" if !plane_at_airport?(plane)
    @landed_planes.delete(plane)
    "#{plane} takes off"
  end

  private

  def full?
    @landed_planes.size >= airport_capacity 
  end

  def plane_at_airport?(plane)
    @landed_planes.include?(plane)
  end

  def check_weather
    (rand(10) > 8) ? "stormy" : "sunny"
  end

end