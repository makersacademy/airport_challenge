class Plane

  def initialize
    @in_airport = true
  end

  def land
    @in_airport = true
  end

  def take_off
    @in_airport = false
  end

  def in_airport?
    @in_airport
  end

end
