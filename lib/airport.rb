require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail "You can't land here. We're full!" if hangar.size >= DEFAULT_CAPACITY
    @hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
    plane
  end 

  def airborne?(plane)
    !hangar.include?(plane)
  end
end
 