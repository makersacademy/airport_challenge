require_relative 'plane'

class Airport

  attr :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    return "Plane has landed"
  end

  def take_off(plane)
      @planes.delete(plane)
      return "Plane has taken off"
  end

end