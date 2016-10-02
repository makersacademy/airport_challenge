class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = true
  end

  def land airport
    airport.landed_planes << self
  end

  def take_off airport
    @landed = false
  end
end
