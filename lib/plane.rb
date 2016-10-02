class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = false
  end

  def land airport
    fail "Airport is full" if airport.full
    fail "Plane can't land when weather is stormy" if airport.stormy_weather
    fail "Plane already landed at an airport" if @landed==true
    @landed = true
    airport.landed_planes << self
  end

  def take_off airport
    fail "Plane can't take-off when weather is stormy" if airport.stormy_weather
    fail "Plane cannot take-off when already in the air" if @landed == false
    fail "Plane not landed at that airport" unless airport.landed_planes.include?(self)
    @landed = false
    airport.landed_planes.delete(self)
  end


end
