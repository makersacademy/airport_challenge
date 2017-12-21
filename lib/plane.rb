class Plane

  attr_reader :landed

  def land_self
    @landed = true
  end

  def take_off_self
    @landed = false
  end

end
