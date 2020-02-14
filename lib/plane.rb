class Plane

  attr_accessor :airborne

  def initialize
    @airborne = false
  end

  def landed
    @airborne = false
  end

  def in_flight
    @airborne = true
  end
end
