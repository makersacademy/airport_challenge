class Plane
  def initialize
    @flying = true
    @in_airport = false
  end

  def flying
    @flying
  end

  def landed
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def in_airport
    @in_airport
  end

  def in_hanger
    @in_airport = true
  end

  def fly_away
    @in_airport = false
  end

  def cleared
    takeoff if !flying
    fly_away if in_airport
  end

  def touch_down
    landed if flying
    in_hanger if !in_airport
  end
end
