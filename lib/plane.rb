class Plane

  def initialize(flight_number)
    @flight_number = flight_number
    @flying = true
  end

  def flight_number
    "Flight #{@flight_number}"
  end

  def status
    @flying ? "Flying" : "Landed"
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end
end
