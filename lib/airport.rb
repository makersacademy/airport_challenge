require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.ground
    planes << plane
  end

  def take_off(plane)
    plane.fly
    planes.delete(plane)
  end

end
