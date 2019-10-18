class Plane
  attr_reader :grounded

  def initialize
    @grounded = true
  end

  def land(airport)
    if airport.plane_capacity.length < airport.max_capacity
      @grounded = true
      airport.plane_capacity << self
    else
      raise "No space available"
    end
  end

  def take_off(airport)
    @grounded = false
    airport.plane_capacity.delete(self)
  end
end
