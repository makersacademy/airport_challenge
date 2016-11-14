require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes, :total_capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY )
    @planes = []
    @total_capacity = capacity
  end

  def land_plane(plane)
    raise("Too stormy to land") if Weather.new.stormy?
    return "Airport full" if full?
    return "Plane has already landed" if landed?(plane)
    @planes << plane
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def take_off_plane(plane)
    raise("Too stormy to take off") if Weather.new.stormy?
    @planes.delete(plane)
    confirm_plane_take_off(plane)
  end

  def confirm_plane_take_off(plane)
    "Plane #{plane} has taken off"
  end

  def full?
    @planes.length >= @total_capacity
  end

end
