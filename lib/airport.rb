require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Too windy to land' if stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'Too windy to take off' if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def stormy?

  end

  def full?

  end


end