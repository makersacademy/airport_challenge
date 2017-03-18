class Plane
# describes the plane only and its methods
  def initialize
    @landed = false
  end

  public
  def land_plane
    @landed = true
  end

  def landed?
    @landed
  end

end
