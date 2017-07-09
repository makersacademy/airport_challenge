class Plane
  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

  def status
    @landed
  end
end
