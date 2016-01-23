class Plane

attr_reader :landed
attr_reader :airport

  def initialize
    @landed
    @airport
  end

  def land(airport, weather)
    raise "error: plane already landed" if landed
    raise "error: cannot land when weather is stormy" if weather.condition == "stormy"
    raise "error: cannot land when airport is full" if airport.full
    @landed = true
    @airport = airport
    airport.planes << self
    self
  end

  def takeoff(airport, weather)
    raise "error: already taken off" unless landed
    raise "error: cannot take off from a different airport" if airport != @airport
    raise "error: cannot take off when weather is stormy" if weather.condition == "stormy"
    @landed = false
    airport.planes.delete(self)
  end

end