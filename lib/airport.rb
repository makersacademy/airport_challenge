require 'weather'

class Airport
  include Weather

  def initialize capacity=100
    @capacity = capacity
    @landing_strip = []
  end

  def capacity
    @capacity
  end

  def landing_strip
    @landing_strip.clone # cloned for security
  end

  def land_plane plane
    @landing_strip << plane
  end

  def remove_plane plane
    @landing_strip.delete(plane)
  end

end
