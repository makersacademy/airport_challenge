class Plane
  attr_reader :landed
  def initialize
    @landed = false
  end

  def land(airport)
    fail "plane already landed" if @landed
    @landed = airport
    airport.plane_landed
  end

  def take_off(airport)
    fail "plane already flying" unless @landed
    fail "plane not in this airport" unless @landed == airport
    @landed = false
    airport.plane_take_off
  end
end
