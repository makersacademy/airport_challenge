require "plane"
class Airport
  attr_reader :plane
  def land(plane)
    raise ' Weather is stormy - cannot land! ' if stormy?
    @plane = plane
  end

  def take_off(plane)
    raise ' Weather is stormy - cannot take_off! ' if stormy?
    @plane = plane
  end

  private
  def stormy?
    rand(6) > 4
  end
end
