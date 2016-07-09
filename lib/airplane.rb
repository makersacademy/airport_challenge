class Airplane
  def initialize
    @landed = true
  end

  def takeoff
    @landed = false
  end

  def land(airport)
    @landed = true
    airport.accept_landing(self)
  end

  def landed?
    @landed
  end
end
