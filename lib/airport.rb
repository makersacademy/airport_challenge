require "plane"
class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise ' Weather is stormy - cannot land! ' if stormy?
    raise ' Airport is full - cannot land ' if full?
    @planes << plane
  end

  def take_off(plane)
    raise ' Weather is stormy - cannot take_off! ' if stormy?
    @planes.pop
  end

  private
  def stormy?
    rand(6) > 4
  end

  def full?
    @planes.length >= 20
  end
end
