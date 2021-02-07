class Airplane
  def initialize
    @landed = false
  end

  def takeoff(airport)
    raise 'Plane is already in the air' unless @landed

    airport.takeoff(self)
    @landed = false
    "Plane has taken off"
  end

  def land(airport)
    raise 'Plane has already landed' if @landed

    airport.land(self)
    @landed = true
    "Plane has landed"
  end
end
