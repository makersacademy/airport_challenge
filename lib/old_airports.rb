#require_relative 'planes'

class Airport
attr_reader :plane

  def initialize
  @plane = []
  end

  def land_plane(plane)
   @plane << plane
  end

  def plane_landed?
  return 'Plane landed successfully' if @landed == true
  end

  def plane_take_off
    @plane.pop
  end

  def plane_taken_off?
    return 'Plane taken off' if @plane == 0
  end

end
