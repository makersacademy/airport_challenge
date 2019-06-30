class Plane
  def initialize
    @grounded = true
  end
  def grounded?
    @grounded
  end
  def taken_off
    @grounded = false
  end

  def landed
    @grounded = true
  end
end
