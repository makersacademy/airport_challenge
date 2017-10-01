class Plane

  attr_reader :landed

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

end