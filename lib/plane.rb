class Plane

  def initialize
    @in_flight = true
  end

  def lands
    @in_flight = false
  end

  def takes_off
    @in_flight = true
  end

  def flying?
    @in_flight
  end

end
