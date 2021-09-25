require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
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
 