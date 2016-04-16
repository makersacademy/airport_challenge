require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.landed
  end

  def take_off(plane)
    @planes.delete(plane)
    plane.departed
  end

end
