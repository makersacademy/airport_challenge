class Plane

  def depart
    @landed = false
  end

  def land
    @landed = true
  end

  def landed?
    @landed
  end
  
end
