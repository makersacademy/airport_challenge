class Plane

  def landed?
    @landed
  end

  def make_land
    @landed = true
  end

  def make_take_off
    @landed = false
  end

end
