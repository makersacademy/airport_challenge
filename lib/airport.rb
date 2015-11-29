require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
   @planes = []
  end

  def land(plane)
    fail 'plane cannot take land in a storm' if stormy?
    @planes << plane
    plane.landing
  end

  def take_off(plane)
    fail 'plane cannot take off in a storm' if stormy?
    @planes.delete(plane)
    plane.taking_off
  end

  def air_control

  end

  private

  def stormy?
    rand > 0.9
  end

end
