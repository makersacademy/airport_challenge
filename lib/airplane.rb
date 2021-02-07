class Airplane
  def initialize
    @landed = false
  end

  def takeoff(airport)
    takeoff_fail
    airport.takeoff(self)
    @landed = false
    "Plane has taken off"
  end

  def land(airport)
    land_fail
    airport.land(self)
    @landed = true
    "Plane has landed"
  end

  private

  def takeoff_fail
    raise 'Plane is already in the air' unless @landed
  end

  def land_fail
    raise 'Plane has already landed' if @landed
  end
end
