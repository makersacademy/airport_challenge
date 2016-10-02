class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = true
  end

  def land airport
    fail "Airport is full" if airport.landed_planes.count > 50
    airport.landed_planes << self
  end

  def take_off airport
    @landed = false
  end


end
