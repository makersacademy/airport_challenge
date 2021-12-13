

class Airport
  attr_accessor :planes, :capacity


  def land_plane
    Plane.new
  end
end
