require_relative "Weather"
require_relative "Plane"

class Airport
  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :landed_planes
  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def airport_full?
    landed_planes.length >= capacity
  end

  def commence_landing(plane)
    clear_landing
    plane.land_at(self)
    store_plane(plane)
  end

  def clear_landing
    fail "Too stormy to land" if stormy?
    fail "Airport full" if airport_full?
  end

  def store_plane(plane)
    self.landed_planes << plane
  end

  def commence_take_off(plane)
    clear_take_off
    plane.take_off(self)
    remove_plane(plane)
  end

  def clear_take_off
    fail "Too stormy to take off" if stormy?
  end

  def remove_plane(plane)
    self.landed_planes = landed_planes.select!{|landed_plane| landed_plane if landed_plane != plane}
  end

private
attr_reader :capacity
attr_writer :landed_planes

end
