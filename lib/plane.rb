class Plane
# describes the plane only and its methods
  def initialize
    @landed = false
  end

  def land_plane
    @landed = true
  end

  def take_off_plane
    @landed = false
  end

attr_reader :landed

end
