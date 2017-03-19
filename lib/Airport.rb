require_relative "Weather"

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

  def clear_landing(plane)
    fail "Too stormy to land" if stormy?
    fail "Airport full" if airport_full?
  end


  def land(plane)
    fail "Only plane can control landing" if plane.flying?
    self.landed_planes << plane
    return "Landed Successfully"
  end

private
attr_reader :capacity
attr_writer :landed_planes

end
