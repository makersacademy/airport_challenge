require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
    "Plane has landed"
  end

  def take_off(plane)
    hangar.delete(plane)
    "Plane has taken off"
  end

end
