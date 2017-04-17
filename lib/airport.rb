require 'weather'

class Airport

  DEFAULT_CAPACITY = 100

  include Weather

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @landing_strip = []
  end

  def capacity
    @capacity
  end

  def full?
    @capacity == @landing_strip.length
  end

  def landing_strip
    @landing_strip.clone
  end

  def land_plane plane
    @landing_strip << plane
  end

  def remove_plane plane
    @landing_strip.delete(plane)
  end

end
