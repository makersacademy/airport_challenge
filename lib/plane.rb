class Plane
  # Understands if a plane is airborne 
  attr_accessor :airborne

  def initialize(airborne = true)
    @airborne = airborne
  end

  def airborne?
    @airborne
  end
end
