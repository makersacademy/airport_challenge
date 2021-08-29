require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def landing(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    "Plane has taken off"
  end

end