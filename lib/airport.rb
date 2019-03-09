require 'plane'

class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
    return "Plane has landed"
  end

  def take_off(plane)
    hangar.delete(plane)
    return "Plane has taken off"
  end

end
