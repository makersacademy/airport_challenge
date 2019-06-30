
class Plane

  def land_plane
    @landed = true
  end

  def take_off
    @landed = false
  end

  def landed?
    @landed
  end

end
