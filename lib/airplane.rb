class Airplane
  def initialize
    @landed = true
  end

  def takeoff(airport)
    @landed = false
    airport.accept_takeoff(self)
  end

  def land(airport)
    @landed = true
    airport.accept_landing(self)
  end

  def landed?
    @landed
  end
end
