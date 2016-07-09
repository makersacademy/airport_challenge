class Plane

  def landed?
    @landed
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

end
