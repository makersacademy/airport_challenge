require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
   @planes = []
  end

  def land(plane)
    fail 'plane cannot take land in a storm' if stormy?
    fail 'Airport is full and cannot land' if full?
    @planes << plane
    plane.landing
  end

  def take_off(plane)
    fail 'plane cannot take off in a storm' if stormy?
    @planes.delete(plane)
    plane.taking_off
  end

  private

  def stormy?
    rand > 0.9
  end

  def full?
    return true if @planes.size >= 10
  end
end
