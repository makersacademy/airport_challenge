class Plane
  def landed?
    @landed
  end

  def landed
    @landed = true
  end

  def flying
    @landed = false
  end

end
