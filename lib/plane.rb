class Plane

  attr_writer :flying

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
end
