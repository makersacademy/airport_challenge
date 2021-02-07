require_relative 'planes'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
    p "Plane has landed"
  end

  def takeoff(plane)
    hangar.pop
    p "Plane has taken off"
  end

  def is_empty
    if hangar.empty?
      return "Space to land here"
    else
      return "Airport is at max capacity"
    end
  end

end