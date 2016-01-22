class Plane

  def land(airport)
    @landed = true
  end

  def takeoff
    @landed = false
  end

  def landed?
    @landed
  end

end
