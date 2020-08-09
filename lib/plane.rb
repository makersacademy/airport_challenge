class Plane
  def at_airport?
    @at_airport
  end

  def flying
    @at_airport = false
  end

  def landed
    @at_airport = true
  end
end
