class Plane

  def initialize
    @grounded = false
  end

  def grounded?
    @grounded
  end

  def land
   @grounded = true
   self
  end

  def takeoff
   @grounded = false
   self
  end

end
