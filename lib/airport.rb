require_relative 'plane'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    fail "Plane cannot land due to stormy conditions" if stormy?
    landed_planes << plane
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'Plane cannot take off due to a stormy conditions' if stormy?
    landed_planes.delete(plane)
    "#{plane} has taken off from #{self}"
  end

  def stormy?
    true if rand(5) == 0
  end

end
