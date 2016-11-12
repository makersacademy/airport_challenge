require_relative 'plane'


class Airport

  attr_reader :plane

  def land_plane(plane)
    @plane = plane
  end

  def landed?(plane)
    @plane = plane
  end

  def takeoff(plane)
    true
  end


end
