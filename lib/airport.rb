require_relative 'plane'


class Airport

  attr_reader :plane

  def land_plane(plane)
    @plane = plane
  end

  def in_airport?(plane)
    return true if @plane
    false
  end

  def takeoff(plane)
    true
  end


end
