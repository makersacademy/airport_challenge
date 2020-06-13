require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes
  def initialize(_planes)
    @planes = []
  end

  def land(plane)
    raise 'Airport capacity full.' if full?
    raise "There is a storm: cannot land." if stormy?

    @planes << plane
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    true
  end

  def take_off(plane)
  end

end
