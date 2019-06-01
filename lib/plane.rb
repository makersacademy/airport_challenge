class Plane
  def land
    @at_airport = true
  end

  def take_off_from(airport)
    true
  end

  def at_airport?
    @at_airport
  end
end