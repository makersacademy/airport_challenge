class Plane
  def initialize
    @landed
    @airport
  end

  def land(airport)
    raise "error: plane already landed" if landed
    @landed = true
    @airport = airport
  end

  def takeoff(airport, weather)
    raise "error: already taken off" unless landed
    raise "error: cannot take off from a different airport" if airport != @airport
    raise "error: cannot take off when weather is stormy" if weather.current == "stormy"
    @landed = false
    airport
  end


attr_reader :landed
attr_reader :airport


end