class Plane
  
  attr_reader :at_airport, :flight_no
  
  def initialize(flight_no)
    @flight_no = flight_no
  end
  
  def leave_airport
    @at_airport = false
  end

  def land_airport
    @at_airport = true
  end

end
