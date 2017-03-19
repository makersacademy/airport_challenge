class Plane
# describes the plane only and its methods
  def initialize
    @landed = false
  end

  def land_plane
    @landed = true # Need to work out why I had to keep the @s in here!
  end

  def take_off_plane
    @landed = false
  end

  def landed?
    @landed
  end


attr_writer :landed

end
