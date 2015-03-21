class Plane
  attr_reader :flying
  alias_method :airborne?, :flying
  def initialize(airborne = false)
    @flying = airborne
  end

  def take_off
    @flying = true
    self
  end

  def land
    @flying = false
    self
  end
end
