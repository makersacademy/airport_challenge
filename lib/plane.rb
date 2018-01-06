class Plane
  attr_accessor :airborne

  def initialize(airborne)
    @airborne = airborne
  end

  def airborne?
    @airborne
  end
end
