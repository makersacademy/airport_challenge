require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    message = 'Unable to land a plane that has already landed before'
    raise message if plane_has_landed_before(plane)
    planes << plane
    plane.has_landed
  end


  private

  attr_reader :planes

  def plane_has_landed_before(plane)
    planes.include?(plane)
  end


end
