require_relative 'plane'

class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def takeoff(plane)
    fail 'Plane not at this airport' unless @hangar.include?(plane)
    plane.landed = false
    @hangar.delete(plane)
  end

end
