require_relative 'plane'

class Airport

  def get_plane
    Plane.new
  end

  def plane
    get_plane
  end

end
