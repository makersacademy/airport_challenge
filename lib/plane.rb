class Plane
  attr_reader :airborne

  def initialize(airborne=true)
    @airborne = airborne
  end

  def land
    raise "Cannot land - already landed!" unless airborne?
    update_airborne(false)
    "Plane has landed"
  end

  def take_off
    raise "Cannot take off - already airborne!" if airborne?
    update_airborne(true)
    "Plane has taken off"
  end

  private

  def airborne?
    self.airborne
  end

  def update_airborne(status)
    @airborne = status
  end

end
