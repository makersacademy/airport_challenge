class Plane
  attr_reader :landed, :in_airport, :cleared

  def initialize
    @landed = true
    @in_airport = false
    @cleared = false
  end

  def has_landed?
    landed
  end

  def takeoff
    landed = false
  end

  def in_airport?
    in_airport
  end

  def fly_away
    in_airport = false
  end

  def cleared
    cleared = true
    fly_away if cleared
    takeoff if cleared
  end
end
