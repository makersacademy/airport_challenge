class Plane
  attr_reader :grounded
  def initialize
    @grounded = true
  end

  def takeoff
    @grounded = false
  end

  def land
    grounded = true
  end

  def grounded?
    grounded
  end
end
