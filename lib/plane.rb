class Plane

  def initialize(landed = false)
    @landed = landed
  end

  def land
    @landed = true
  end

  def flying
    @landed = false
  end

end
