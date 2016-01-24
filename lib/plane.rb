class Plane

attr_reader :landed, :airport

  def initialize
    @airport
  end

  def land(airport, weather)
    fail "Plane already landed" if landed
    fail "Can't land when weather is stormy" if weather.condition == "stormy"
    fail "Can't land when airport is at capacity" if airport.full
    @landed = true
    @airport = airport
    airport.planes << self
    self
  end

  def takeoff(airport, weather)
    fail "Plane already airborne" unless landed
    fail "Plane not at this airport" unless airport == @airport
    fail "Can't take off - weather is stormy" if weather.condition == "stormy"
    @landed = false
    airport.planes.delete(self)
  end

end