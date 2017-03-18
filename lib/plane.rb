class Plane
# describes the plane only and its methods
  def initialize
    @landed = false
  end

  public
  def land_plane
    @landed = true
  end

  def take_off_plane
    @landed = false
  end

  def landed?
    @landed
  end

attr_reader :landed

end
