require_relative 'planes'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end

  def change_capacity(number)
    @capacity = number
    return "Capacity changed to #{number}"
  end

  def land(plane)
    hangar << plane
  end

  def takeoff
    hangar.pop
  end

  # def empty?
  #   return "Airport is empty" if hangar.empty? 
  #   return "Airport contains plane" if hangar.length >= 1
  # end

  def safety_check
    return "Space available, please land here" if hangar.length < capacity
    return "Capacity is full, do not land" if hangar.length >= capacity
  end
end
