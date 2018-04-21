require 'plane'

class Airport
  attr_reader :capacity, :landed_planes

  def initialize(capacity = 10)
    @capacity = capacity
    @landed_planes = []
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def land_plane(plane)
    @landed_planes << plane
    "#{plane} plane landed"
  end

  def plane_take_off(plane)
    "#{plane} plane has taken off"
  end
end
