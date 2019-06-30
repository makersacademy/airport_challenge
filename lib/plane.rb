class Plane
  def initialize
    @grounded = true
  end
  def grounded?
    @grounded
  end

  def takeoff
    @grounded = false
  end

  def land
    @grounded = true
  end
end
