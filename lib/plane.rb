class Plane
  
  def landed?
    @landed
  end

  def land
    @landed = true # marks the plane as landed
  end

  def take_off
    @landed = false # marks the plane as taken off
  end

end
