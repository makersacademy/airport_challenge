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

  def takeoff(airport)
    raise "error: already taken off" unless landed
    raise "error: cannot take off from a different airport" if airport != @airport
    @landed = false
    airport
  end


attr_reader :landed
attr_reader :airport


end