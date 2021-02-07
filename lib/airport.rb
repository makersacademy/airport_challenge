require_relative 'planes'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
    p "Plane successfully landed"
  end

  def takeoff
    hangar.pop
    p "Plane successfully taken off"
  end

  def empty?
    return "Airport has space available" if hangar.empty?
    return "Airport is at max capacity" if hangar.length >= 1
  end

  def safety_check
    return "Space available, please land here" if hangar.empty?
    return "Capacity is full, do not land" if hangar.length >= 1
  end
end
