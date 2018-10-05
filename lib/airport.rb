class Airport

  def initialize
    @weather = "stormy"
  end

  def land(plane)
    plane.set_status("land")
  end

  def takeoff(plane)
    plane.set_status("air")
  end

  def statuscheck(plane)
    true
  end

  def prevent_takeoff(plane)
    true
  end

  def weather?
    @weather
  end

  def prevent_landing(plane)
    true
  end

  def capacity?
    true
  end

  def set_capacity
    true
  end
end
