class Plane
  attr_reader :airborne

  def initialize(airborne=true)
    @airborne = airborne
  end

  def land
    raise "Cannot land - already landed!" unless airborne?
    raise "Cannot land - weather is stormy!" unless sunny?
    update_airborne(false)
    "Plane has landed in sunny weather"
  end

  def take_off
    raise "Cannot take off - already airborne!" if airborne?
    raise "Cannot take off - weather is stormy!" unless sunny?
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

  def sunny?
    Weather.sunny?
  end

end
