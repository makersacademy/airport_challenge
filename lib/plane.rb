class Plane
  def initialize(flight_number)
    @flight_number = flight_number
    @flying
  end

  def flight_number
    "Flight #{@flight_number}"
  end

  attr_accessor :flying
end