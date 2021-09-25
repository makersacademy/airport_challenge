class Plane 

  attr_accessor :grounded

  def initialize(grounded = true)
    @grounded = grounded
  end

  def can_land(_airport)
    !grounded
  end

  def can_takeoff(_airport)
    grounded
  end
end
