class Plane 

  attr_accessor :grounded

  def initialize(grounded = true)
    @grounded = grounded
  end

  def can_land(airport)
    !grounded
  end

  def can_takeoff(airport)
    grounded
  end

end
