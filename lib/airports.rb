require_relative 'planes'

class Airport

  def initialize
    @plane = []
  end

  def land_plane(plane)
   @plane << plane
  end

  def plane_landed?
  return 'Plane landed successfully' if @plane.count >= 1
  end

  def take_off
    
  end

  end
