class Plane

  def initialize
    @landed = false
  end

  def land(airport)
    @landed = true
  end

  def landed?
    @landed
  end

end
