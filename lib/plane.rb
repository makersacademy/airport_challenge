class Plane

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end

  def land
    @landed = true
  end

end
