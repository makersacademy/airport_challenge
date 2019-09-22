class Plane

  def initialize
    @grounded = false
  end

  def grounded?
    @grounded
  end

  def fly
    @grounded = false
  end

  def land
    @grounded = true
  end

end
