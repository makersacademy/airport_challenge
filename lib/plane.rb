class Plane

  def initialize
    @in_airport = true
  end

  def landed
    @in_airport = true
  end

  def taken_off
    @in_airport = false
  end

  def in_airport?
    @in_airport
  end

end
