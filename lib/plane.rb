class Plane

  def initalize(start_landend=true)
    @landed = start_landend
  end

  def land
    @landed = true
  end

  def has_landed?
    @landed
  end

end
