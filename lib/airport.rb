class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    landed_planes << plane
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'Plane cannot take off due to a stormy conditions' if stormy?
    landed_planes.delete(plane)
    "#{plane} has taken off from #{self}"
  end

  def stormy?
    true if rand(0) == 0
  end

end
