class Plane

  def initialize landed = true
    @landed = landed
  end

  # Lands the plane and returns its status
  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

  def landed?
    @landed
  end

end
