class Plane
  def initialize
    @landed = false
  end

  def takeoff
    @landed = false
  end

  def land
    @landed = true
  end

  def landed?
    @landed
  end
end
