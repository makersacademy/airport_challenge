class Plane
  def initialize
    @in_flight = false
  end

  def land
    @in_flight = false 
  end

  def takeoff
    @in_flight = true
  end

  def flying?
    return @in_flight
  end

end