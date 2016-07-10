require_relative "plane.rb"

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    plane.flying = false
    @planes << plane
  end

  def take_off
    @planes[-1].flying = true
    @planes.pop

  end

end
