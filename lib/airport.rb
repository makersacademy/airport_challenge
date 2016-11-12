require_relative 'plane'

class Airport

  def initialize
  end

  def get_plane
    Plane.new
  end

  def plane
    get_plane
  end

  def land(plane)
  end

end
