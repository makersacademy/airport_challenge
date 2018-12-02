require "plane"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def landing_plane(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
