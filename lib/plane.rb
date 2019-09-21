class Plane

  def initialize
    @in_flight = true
  end

  def land
    @in_flight = false
  end

  def take_off
    @in_flight = true
  end
  

  def landed?
    !@in_flight
  end

  def in_flight?
    @in_flight
  end
end