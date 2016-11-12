require_relative 'plane'

class Airport

  attr_reader :plane

  def get_plane
    Plane.new
  end

  def plane=(plane)
    @plane = plane
  end

  def land(plane)
    self.plane=(plane)
  end

  def remove_plane
    self.plane=(nil)
  end

end
