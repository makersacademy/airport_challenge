require_relative 'planes'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
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
    return "Airport is empty" if hangar.empty? 
    return "Airport contains plane" if hangar.length >= 1
  end

  def safety_check
    return "Space available, please land here" if hangar.length < capacity
    return "Capacity is full, do not land" if hangar.length >= capacity
  end
end
