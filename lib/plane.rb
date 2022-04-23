class Plane
  attr_reader :landed
  attr_writer :weather

  def initialize
    @landed = false
    @weather = "fair"
  end

  def land(airport)
    fail "plane already landed" if @landed
    fail "landing is prevented in stormy weather" if @weather == "stormy"
    @landed = airport
    airport.plane_landed
  end

  def take_off(airport)
    fail "plane already flying" unless @landed
    fail "plane not in this airport" unless @landed == airport
    fail "take off is prevented in stormy weather" if @weather == "stormy"
    @landed = false
    airport.plane_take_off
  end
end
