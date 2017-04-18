class Plane
  def landed?
    @landed
  end

  def land
    @landed = true
  end

  def fly
    @landed = false
  end
end
