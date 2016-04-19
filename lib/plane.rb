class Plane

  def initialize
    @landed = false
  end

  def status
    @landed
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

end
