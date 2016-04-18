class Plane
  def initialize
    @in_airport = false
  end

  def at_airport?
    @in_airport
  end

  def landed
    @in_airport = true
  end

  def taken_off
    @in_airport = false
  end
end
