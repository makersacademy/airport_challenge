class Plane
  def initialize in_flight = false
    @in_flight = in_flight
  end

  def in_flight?
    @in_flight
  end

  def land
    @in_flight = false
  end

  def takeoff
    @in_flight = true
  end 
end
