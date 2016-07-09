class Airplane
  def initialize
    @landed = true
  end

  def takeoff
    @landed = false
  end

  def land(airport)
    @landed = true
  end

  def landed?
    @landed
  end
end
