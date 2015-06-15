class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    @landed
  end

  def land
    @landed = true
    @flying = false
  end

  def take_off
    @landed = false
    @flying = true
  end

end
