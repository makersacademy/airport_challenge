require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes, :total_capacity

  def initialize(capacity = 10)
    @planes = []
    @total_capacity = capacity
  end

  def land_plane(plane)
    raise("Too stormy to land") if Weather.new.stormy?
    raise ("Airport full") if full?
    @planes << plane
    confirm_plane_landing(plane)
  end

  def confirm_plane_landing(plane)
    "Plane #{plane} has landed"
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
    @planes.length == @total_capacity
  end

end
