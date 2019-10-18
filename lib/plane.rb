class Plane
  attr_reader :grounded

  def initialize
    @grounded = true
  end

  def land(airport)
    @grounded = true
    airport.plane_capacity << self
  end
end
