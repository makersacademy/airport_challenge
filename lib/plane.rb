class Plane

  def intialize(status = "airborne")
    @status = status
  end

  def land
    @status = "landed"
  end

  def take_off
    @status = "airborne"
  end

end
