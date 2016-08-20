class Plane

  def initialize
    @landed = false
    @flying = true
  end

  def landed
    @flying = false
    @landed = true
  end

  def takeoff
    @landed = false
    @flying = true
  end

end
