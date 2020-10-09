class Plane
  def initialize
    @in_air = false
    @in_airport = false
  end

  def flying
    @in_air = true
    @in_airport = false
  end

  def landed
    @in_airport = true
  end

  def in_air?
    @in_air
  end

  def in_airport?
    @in_airport
  end

end
