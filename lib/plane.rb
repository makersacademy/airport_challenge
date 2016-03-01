class Plane
  attr_reader :flying, :in_airport

  def initialize
    @flying = true
    @in_airport = false
  end

  def cleared
    takeoff if !flying
    fly_away if in_airport
  end

  def touch_down
    land if flying
    in_hanger if !in_airport
  end

  private

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def in_hanger
    @in_airport = true
  end

  def fly_away
    @in_airport = false
  end
end
