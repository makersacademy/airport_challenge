class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def in_flight
    @landed = false
  end

  def touch_down
    @landed = true
  end

end
