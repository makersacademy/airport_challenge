class Plane

  def initialize
    @landed = true
    #airport.landed_planes << self
  end

  def land(airport)
    @landed = true
    airport.landed_planes << self
  end

end
