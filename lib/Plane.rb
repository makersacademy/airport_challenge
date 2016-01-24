class Plane
  def land
    @landed = true
  end

  def take_off
    @landed = false
  end
end