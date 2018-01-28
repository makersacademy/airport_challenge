class Plane
  def landed
    @landed = true
  end

  def take_off
    @landed = false
  end
  def landed?
    @landed
  end
end
