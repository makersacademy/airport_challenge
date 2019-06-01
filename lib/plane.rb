class Plane
  def land
    @at_airport = true
  end

  def take_off
    @at_airport = false
  end

  def at_airport?
    @at_airport
  end
end