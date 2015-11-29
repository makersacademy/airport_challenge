require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail 'Plane is not at this airport' if plane_not_present?(plane)
    plane.take_off
    planes.delete(plane)
  end

  private

  def plane_not_present?(plane)
    !planes.include?(plane)
  end

end
