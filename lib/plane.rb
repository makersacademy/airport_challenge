class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land_plane
    @flying = false
  end

  def take_off
    @flying = true
  end

end
