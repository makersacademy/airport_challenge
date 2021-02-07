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
      return "Airport has space available"
    else
      return "Airport is at max capacity"
    end
  end

  def safety_check
    if hangar.empty?
      return "Space available, please land here"
    else 
      return "Capacity is full, do not land"
    end
  end
end