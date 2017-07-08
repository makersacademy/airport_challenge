class Plane

  def take_off
    @landed = false
  end
  
  def land_at airport
    @landed = true
  end

  def landed?
    @landed
  end

end
