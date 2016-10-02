class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = true
  end

  def land airport
    fail "Airport is full" if airport.full
    fail "Plane can't land when weather is stormy" if airport.stormy_weather
    airport.landed_planes << self
    @landed = true
  end

  def take_off airport
    fail "Plane can't take-off when weather is stormy" if airport.stormy_weather
    @landed = false
  end


end
