class Plane
  attr_reader :grounded

  def initialize
    @grounded = true
  end

  def land(airport)
    @grounded = true
    airport.plane_capacity << self
  end

  def take_off(airport)
    @grounded = false
    airport.plane_capacity.delete(self)
  end
end
