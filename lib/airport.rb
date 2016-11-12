require_relative 'plane'


class Airport

  def plane
    @plane
  end

  def land_plane(plane)
    @plane = plane
  end

  def landed?(plane)
    return true if @plane
    false
  end

  def takeoff(plane)
    true
  end


end
