class Plane
  
  attr_reader :at_airport

  def leave_airport
    @at_airport = false
  end

  def land_airport
    @at_airport = true
  end

end
