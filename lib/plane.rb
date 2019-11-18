class Plane

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
