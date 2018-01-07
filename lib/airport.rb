require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.has_landed
    @planes << plane
  end

  def take_off(plane)
    plane.has_taken_off
    @planes.delete(plane)
    @planes
  end

end
