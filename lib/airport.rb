class Airport
  attr_reader :hangar
  
  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

  def plane_check(plane)
    @hangar.include?(plane)
  end

  
end


class Plane
  
end