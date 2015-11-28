class Plane

  attr_reader :landed

  def initialize
    @landed = true
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
