require_relative 'airport'

class Plane

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def land(airport)
    @landed = true
    airport.landed_planes << self
    self
  end

end
