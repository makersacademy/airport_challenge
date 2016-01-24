class Plane

attr_reader :landed, :airport

  def initialize
    @landed; @airport
  end

  def land(airport, weather)
    raise "Plane already landed" if landed
    raise "Can't land when weather is stormy" if weather.condition == "stormy"
    raise "Can't land when airport is at capacity" if airport.full
    @landed, @airport = true, airport
    airport.planes << self
    self
  end

  def takeoff(airport, weather)
    raise "Plane already airborne" unless landed
    raise "Plane not at this airport" unless airport == @airport
    raise "Can't take off when weather is stormy" if weather.condition == "stormy"
    @landed = false
    airport.planes.delete(self)
  end

end