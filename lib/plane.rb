class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def land_at_airport(airport)
    raise 'Plane already landed' if landed?
    airport.land_plane(self)
  end

  def takeoff
    @landed = false
  end

  def landed?
    @landed
  end

end
