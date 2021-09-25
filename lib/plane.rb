class Plane
  def initialize
    @airport = nil
  end

  def land(airport)
    @airport = airport
  end

  def takeoff
    @airport = nil
  end

  def in_airport?(airport)
    @airport == airport
  end
end
