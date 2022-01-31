class Plane
  def initialize
    @in_flight = false
  end

  def land
    @in_flight = false
    "Plane has landed" 
  end

  def takeoff
    @in_flight = true
    puts "Plane has taken off"
  end

  def flying?
    return @in_flight
  end

end