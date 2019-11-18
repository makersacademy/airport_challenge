class Plane
  attr_reader :grounded

  def land(_airport)
    @grounded = true
  end

  def takeoff(_airport)
    @grounded = false
  end

  def grounded?
    @grounded
  end

end
