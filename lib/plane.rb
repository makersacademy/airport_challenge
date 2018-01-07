class Plane
  # Understands if a plane is airborne - at the moment this is redundant and needs refactoring
  attr_accessor :airborne

  def initialize(airborne = false)
    @airborne = airborne
  end

  def airborne?
    @airborne
  end
end
