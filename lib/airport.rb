require_relative 'plane'

class Airport
  attr_reader :plane
  def land_plane
  end

  def plane_departed?(plane)
    @plane = plane
  end

end
