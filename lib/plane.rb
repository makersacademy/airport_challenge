class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def in_flight
    @landed = false
  end

  def touch_down
    fail "This plane has landed elsewhere" if @landed
    @landed = true
  end

end